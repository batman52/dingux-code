/*
   This file is part of GReader2X

    GReader2X is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    GReader2X is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with GReader2X; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
#include "player.h"
#include "GetDir.h"
#include <stdio.h>
#include <stdlib.h>
#include <linux/soundcard.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <fcntl.h>
#include <string>


TPlayer* mythis;

TPlayer::TPlayer(TScrn *sc) {
  mythis = this;
  scrn = sc;
  playing = false;
  paused = false;
  Mix_OpenAudio(MIX_DEFAULT_FREQUENCY, AUDIO_S16, MIX_DEFAULT_CHANNELS, 1024);
  Mix_HookMusicFinished(&TPlayer::songEnded);
  music = NULL;
}

TPlayer::~TPlayer() {
  Mix_FreeMusic(music);
  Mix_CloseAudio();
  mythis = NULL;
}

void TPlayer::init(string dr) {
  playlist.clear();
  GetDir dir(scrn);
  dir.AddExt(".ogg");
  dir.AddExt(".wma");
  dir.AddExt(".m3u"); 
  dir.AddExt(".mp2");
  dir.AddExt(".mp3");
  dir.AddExt(".rm");
  dir.AddExt(".flv");
  dir.AddExt(".flac");
  dir.scanFiles(dr);
  system("mkfifo /tmp/fifofile");
  for (int i = 1;i < dir.Count();i++) {
    playlist.push_back(dr+"/"+dir.Item(i));
  }
  volume = 40;
  Mix_VolumeMusic(volume);
  currentTrack = 0;
}

void TPlayer::loadFile(string fl) {
  string postfix;
  size_t pos;
  pos=fl.find_last_of(".");
  postfix=fl.substr(pos+1);
  //cout<<fl<<endl;
  //cout<<postfix<<endl;
  //
  if(postfix.compare("m3u")==0)
  Mix_SetMusicCMD("/boot/local/apps/mplayer/mplayer.dge -slave -input file=/tmp/fifofile -playlist");
  else
  Mix_SetMusicCMD("/boot/local/apps/mplayer/mplayer.dge -slave -input file=/tmp/fifofile");

  music = Mix_LoadMUS(fl.c_str());
  if(!music) {
    fprintf(stderr,"Error: %s\n", Mix_GetError());
  }
}

void TPlayer::play(void) {
//	int playmark;
  if (playlist.size() > 0 && !playing) {
    if (music == NULL) {
      loadFile(playlist[currentTrack]);
    }
    playing = true;
    paused = false;
    Mix_CloseAudio();
    Mix_PlayMusic(music, 1);
//   printf("%d\n", playmark);
   // nextSong();
  }
}

void TPlayer::pause(void) {
  if (playing) {
    if (paused) {
      paused = false;
      //Mix_ResumeMusic();
      system("echo pause > /tmp/fifofile");
    } else {
      paused = true;
      //Mix_PauseMusic();
      system("echo pause > /tmp/fifofile");
    }
  }
}

void TPlayer::stop(void) {
  if (playing) {
    playing = false;
    Mix_HaltMusic();
    //system("echo quit > /tmp/fifofile");
    music = NULL;
  }
}

void TPlayer::changeVolume(int vol) {
  volume += vol;
  if (volume > 100) volume = 100;
  if (volume < 0) volume = 0;
 // Mix_VolumeMusic(volume);
 // Add by vimrc, from Dmenu by leo.5xl.bigfat
  char *mixer_device = "/dev/mixer";
  int mixer;
  int oss_volume = volume | (volume << 8); // set volume for both channels
  mixer = open(mixer_device, O_WRONLY);
	  if (ioctl(mixer, SOUND_MIXER_WRITE_VOLUME, &oss_volume) == -1) {
    		 fprintf(stderr, "Failed opening mixer for write - VOLUME\n");
     		}
 close(mixer);
}

void TPlayer::nextSong(void) {
  stop();
  if (++currentTrack == (int)playlist.size()) {
    currentTrack = 0;
  }
  play();
  //system("echo \"pt_step 1\" > /tmp/fifofile");
}

void TPlayer::songEnded(void) {
  mythis->nextSong();
}

void TPlayer::show(void) {
  int done = 999;
  bool redraw = true;
  int maxrows = (scrn->h-51) / scrn->menurowheight;
  int toprow = 0;
  int currentButton = 0;
  while (done != -1) {
    if (redraw) {
      if (currentTrack > maxrows) {
        toprow = currentTrack-maxrows;
      } else {
        toprow = 0;
      }
      scrn->Clear();
      scrn->drawRoundrect(3,3,scrn->w-6,scrn->h-56,4,scrn->MainFG);
      scrn->drawRoundrect(4,4,scrn->w-8,scrn->h-58,4,scrn->MainBG);
      for (int i = 0; i<maxrows;i++) {
        if (toprow + i == currentTrack) {
          scrn->drawRoundrect(6,5+i*scrn->menurowheight,scrn->w-12,scrn->menurowheight,3,scrn->StatBarBG);
        }
        if (toprow+i < (int)playlist.size()) {
          scrn->drawCliptext(8, 5+i*scrn->menurowheight,scrn->w-12,scrn->menurowheight,playlist[toprow+i].substr(playlist[i].rfind("/")+1),scrn->menufont);
        }
      }
      if (playing) {
        if (paused) {
          scrn->drawText(8, scrn->h-52,scrn->lang[17]+"...",scrn->menufont);        
        } else {
          scrn->drawText(8, scrn->h-52,scrn->lang[18]+"...",scrn->menufont);
        }
      } else {
        scrn->drawText(8, scrn->h-52,scrn->lang[19],scrn->menufont);        
      }
      for (int i = 0;i<3;i++) {
        drawButton(i,(i+1)*(scrn->w/5)-10,scrn->h-29, (i == currentButton));
      }
      drawVolume();
      scrn->Flip();
    }
    scrn->joy->Check();

    if (scrn->joy->isLeft()) {
      if (--currentButton < 0) {
        currentButton = 0;
      }
      redraw = true;
    } else if (scrn->joy->isRight()) {
      if (++currentButton > 2) {
        currentButton = 2;
      }
      redraw = true;
    } else if (scrn->joy->isUp()) {
      if (--currentTrack < 0) {
        currentTrack = playlist.size()-1;
      // system("echo \"pt_step -1\" > /tmp/fifofile");
      }
      if (playing) {
        stop();
        play();
      }
      redraw = true;
    } else if (scrn->joy->isDn()) {
      if (++currentTrack > (int)playlist.size()-1) {
        currentTrack = 0;
       // system("echo \"pt_step 1\" > /tmp/fifofile");
      }
      if (playing) {
        stop();
        play();
      }
      redraw = true;
    } else if (scrn->joy->isVolup()) {
      changeVolume(5);
      redraw = true;
    } else if (scrn->joy->isVoldown()) {
      changeVolume(-5);
      redraw = true;
// add by vimrc////////////////////////////////////
    } else if (scrn->joy->isPgup()) {
      system("echo \"pt_step -1\" > /tmp/fifofile");
      redraw = true;

    } else if (scrn->joy->isPgdn()) {
      system("echo \"pt_step +1\" > /tmp/fifofile");
      redraw = true;
////////////////////////////////////////////////////
    } else if (scrn->joy->isSelect()) {
      switch (currentButton) {
        case 0:
          if (!playing) {
            play();
          } else if (paused) {
            pause();
          }
          break;
        case 1:
          if (playing) {
            if (!paused) {
              pause();
            }
          }
          break;
        case 2:
          if (playing) {
            stop();
          }
          break;
      }
      redraw = true;
    } else if (scrn->joy->isExit()) {
      done = -1;
    } else if (scrn->joy->isPlayer()) {
      done = -1;
    }
  }
}

void TPlayer::drawButton(int but, int x, int y, bool hi) {
  if (hi) {
    scrn->drawRoundrect(x,y,20,20,7,scrn->MenuHiBG);
  } else {
    scrn->drawRoundrect(x,y,20,20,7,scrn->StatBarBG);
  }
  switch (but) {
    case 0:
      for (int i = 0; i< 8; i++) {
        scrn->drawRect(x+5+i,y+3+i,i,14-i*2,scrn->MainFG);
      }
      break;
    case 1:
      scrn->drawRect(x+5,y+5,4,11,scrn->MainFG);
      scrn->drawRect(x+12,y+5,4,11,scrn->MainFG);
      break;
    case 2:
      scrn->drawRect(x+5,y+5,11,11,scrn->MainFG);
      break;
    case 3:
      for (int i = 0; i< 8; i++) {
        scrn->drawRect(x+3+i,y+5+i,14-i*2,i,scrn->MainFG);
      }
      break;
    case 4:
      for (int i = 0; i< 8; i++) {
        scrn->drawRect(x+4+i,y+15-i*2,14-i*2,i,scrn->MainFG);
      }
      break;
  }
}

void TPlayer::drawVolume(void) {
  for (int i = 0; i < 40; i += 5) {
    if ((i*2) < volume) {
      scrn->drawRect(scrn->w - 45+i,scrn->h-22-(i / 2),3,6+i/2,scrn->MenuHiBG);
    } else {
      scrn->drawRect(scrn->w - 45+i,scrn->h-22-(i / 2),3,6+i/2,scrn->MainFG);
    }
  }
}
