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

#include <iostream>
#include <fstream>
#include "screen.h"
#include "utils.h"

using namespace std;

TScrn::TScrn(Joystick* jy) {
  joy = jy;
  if (SDL_Init (SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_JOYSTICK | SDL_INIT_TIMER) < 0) {
//  if (SDL_Init (SDL_INIT_VIDEO | SDL_INIT_JOYSTICK | SDL_INIT_TIMER) < 0) {
	fprintf (stderr, "Couldn't initialize SDL: %s\n", SDL_GetError ());
	exit (1);
  }
  TTF_Init();

/* Set 320x240 16-bits video mode */
  screen = SDL_SetVideoMode (320, 240, 16, SDL_SWSURFACE);
  if (screen == NULL) {
	fprintf (stderr, "Couldn't set 320x240x16 video mode: %s\n", SDL_GetError ());
	exit (2);
  }
  background = NULL;
  mainfont = NULL;
  menufont = NULL;
  canvas = NULL;
};

TScrn::~TScrn() {
#ifdef GP2X
  if (joy->Speed > 0) {
    SetClock(joy->Speed);
  }
#endif
  //SDL_Quit();
  TTF_CloseFont(mainfont);
  TTF_CloseFont(menufont);
  TTF_Quit();
  SDL_FreeSurface(background);
  SDL_FreeSurface(canvas);
  SDL_FreeSurface(screen);
  SDL_Quit();
};

void TScrn::init(void) {
  loadcfg();
}

void TScrn::Clear(void) {
  SDL_FillRect( canvas, 0, SDL_MapRGB( canvas->format, MainBG[0], MainBG[1], MainBG[2]));
  if (background != NULL) {
    SDL_Rect rect = {0,0,0,0};
    SDL_BlitSurface(background, NULL, canvas, &rect);
  }
};

void TScrn::Flip(void) {
  if (Rotate != 0) {
    SDL_Surface* dst = NULL;
    switch (Rotate) {
      case 90:
        dst = Rotate90(canvas);
        break;
      case 180:
        dst = Rotate180(canvas);
        break;
      case 270:
        dst = Rotate270(canvas);
        break;
    }
    SDL_BlitSurface(dst, NULL, screen, NULL);    
    SDL_Flip(screen);
    SDL_FreeSurface(dst);
  } else {
    SDL_BlitSurface(canvas, NULL, screen, NULL);    
    SDL_Flip(screen);
  }
};

void TScrn::loadBackground(string bg) {
  //printf("start to load\n");
  background = IMG_Load(bg.c_str());
  //background = IMG_Load("tuxhorizontal.jpg");
};

void TScrn::drawText(int x, int y, string str, TTF_Font *font) {
  SDL_Color foregroundColor = { MainFG[0], MainFG[1], MainFG[2] };
  SDL_Surface* textSurface =  TTF_RenderUTF8_Blended(font,str.c_str(), foregroundColor);
  SDL_Rect textLocation = { x, y, 0, 0 };
  SDL_BlitSurface(textSurface, NULL, canvas, &textLocation);
  SDL_FreeSurface(textSurface);
};

void TScrn::drawCliptext(int x, int y, int w, int h, string str, TTF_Font *font) {
  SDL_Color foregroundColor = { MainFG[0], MainFG[1], MainFG[2] };
  SDL_Surface* textSurface =  TTF_RenderUTF8_Blended(font,str.c_str(), foregroundColor);
  SDL_Rect cliprect = {x,y,w,h};
  SDL_Rect textLocation = { x, y, 0, 0 };
  SDL_SetClipRect(canvas,&cliprect);
  SDL_BlitSurface(textSurface, NULL, canvas, &textLocation);
  SDL_SetClipRect(canvas,NULL);
  SDL_FreeSurface(textSurface);
};

void TScrn::drawInt(int x, int y, int number, TTF_Font *font) {
  char tmp_num[16];
  SDL_Surface* textSurface;
  sprintf((char*)tmp_num, "%d", number);
  SDL_Color foregroundColor = { MainFG[0], MainFG[1], MainFG[2] };
  textSurface =  TTF_RenderUTF8_Blended(font,tmp_num, foregroundColor);
  SDL_Rect textLocation = { x, y, 0, 0 };
  SDL_BlitSurface(textSurface, NULL, canvas, &textLocation);
  SDL_FreeSurface(textSurface);
};

void TScrn::drawRect(int x, int y, int w, int h, int col[3]) {
  SDL_Rect rect = {x,y,w,h};
  SDL_FillRect( canvas, &rect,SDL_MapRGB( canvas->format, col[0], col[1], col[2]));
}

int TScrn::sizeText(string str, TTF_Font *font) {
  int tmpi;
  TTF_SizeUTF8(font,str.c_str(),&tmpi,NULL);
  return tmpi;
}


void TScrn::drawRoundrect(int xo, int yo, int w, int h, int r, int col[3]) {
  int yd = canvas->pitch / canvas->format->BytesPerPixel;
  Uint32* pixels = NULL;
  Uint32 color = SDL_MapRGB( canvas->format, col[0], col[1], col[2]); 
  int x,y,i,j;
  int rpsqrt2 = (int) (r / sqrt( 2 ) );

  w /= 2;
  h /= 2;

  xo += w;
  yo += h;

  w -= r;
  h -= r;

  SDL_LockSurface( canvas );
  pixels = (Uint32*)( canvas->pixels );

  int sy = (yo-h)*yd;
  int ey = (yo+h)*yd;
  int sx = (xo-w);
  int ex = (xo+w);
  for( i = sy; i<=ey; i+=yd )
    for( j = sx-r; j<=ex+r; j++ )
      pixels[i+j] = color;

  int d = -r;
  int x2m1 = -1;
  y = r;
  for( x=0; x <= rpsqrt2; x++ ) {
    x2m1 += 2;
    d+= x2m1;
    if( d >= 0 ) {
      y--;
      d -= (y*2);
    }

    for( i=sx-x; i<=ex+x; i++ )
      pixels[sy-y*yd + i] = color;

    for( i=sx-y; i<=ex+y; i++ )
      pixels[sy-x*yd + i] = color;

    for( i=sx-y; i<=ex+y; i++ )
      pixels[ey+x*yd + i] = color;

    for( i=sx-x; i<=ex+x; i++ )
      pixels[ey+y*yd + i] = color;

  }
  SDL_UnlockSurface( canvas );
}

SDL_Surface* TScrn::Rotate270(SDL_Surface* src) {

  SDL_Surface* dst;
  dst = SDL_CreateRGBSurface(SDL_SWSURFACE,src->h,src->w,32,0, 0, 0, 0);
  register long count;
  register char *s0 = (char*)src->pixels + (dst->w-1) * src->pitch;	/* lower left */
  register char *d0 = (char*)dst->pixels;						/* upper left */
  register long *s, *d;
  long width = dst->w;
  long height = dst->h;
  SDL_LockSurface(dst);
  for ( ; width--; s0 -= src->pitch, d0 += sizeof(long)) {
	for (count = height, s = (long*)s0, d = (long*)d0; count--; s++, d = (long*)((char*)d + dst->pitch)) {
      *d = *s;
    }
  }
  SDL_UnlockSurface(dst);
  return dst;
}

SDL_Surface* TScrn::Rotate90(SDL_Surface* src) {

  SDL_Surface* dst;
  dst = SDL_CreateRGBSurface(SDL_SWSURFACE,src->h,src->w,32,0, 0, 0, 0);
  long width = dst->w;
  long height = dst->h;

  register long count;
  register char *s0 = (char*)src->pixels + (height-1) * 4;
  register char *d0 = (char*)dst->pixels;

  register long *s, *d;
  SDL_LockSurface(dst);
  for ( ; width--; s0 += src->pitch, d0 += sizeof(long)) {
    for (count = height, s = (long*)s0, d = (long*)d0; count--; s--, d = (long*)((char*)d + dst->pitch)) {
      *d = *s;
    }
  }
  SDL_UnlockSurface(dst);
  return dst;
}

SDL_Surface* TScrn::Rotate180(SDL_Surface* src) {

  SDL_Surface* dst;
  dst = SDL_CreateRGBSurface(SDL_SWSURFACE,src->w,src->h,32,0, 0, 0, 0);
  long width = dst->w;
  long height = dst->h;

  register long count;
  register char *s0 = (char*)src->pixels + (width-1) * 4 + ((height-1) * src->pitch);
  register char *d0 = (char*)dst->pixels;														/* upper left */

  register long *s, *d;
  for ( ; height--; s0 -= src->pitch, d0 += dst->pitch) {
    for (count = width, s = (long*)s0, d = (long*)d0; count--; s--, d++) {
      *d = *s;
    }
  }
  SDL_UnlockSurface(dst);
  return dst;
}

void TScrn::loadcfg(void) {
  string col,TmpCol, TmpKey, tmpS;
  vector<string> tmpkeys;
  string line, option;
  ifstream infil("greader2x.cfg");

  DocBase = "/";
  AudioBase = "/";
  Background = "";
  Rotate = 0;
  joy->Speed = 200;
  joy->minSpeed = 50;
  MainFont = "Vera.ttf";
  MainFontSize = 10;
  MainFontBold = 0;
  MenuFont = "arial.ttf";
  MenuFontSize = 12;
  MenuFontBold = 0;
  MainBG[0] = 0;
  MainBG[1] = 0;
  MainBG[2] = 0;
  MainFG[0] = 255;
  MainFG[1] = 255;
  MainFG[2] = 255;
  StatBarBG[0] = 255;
  StatBarBG[1] = 0;
  StatBarBG[2] = 0;
  MenuHiBG[0] = 128;
  MenuHiBG[1] = 128;
  MenuHiBG[2] = 255;
  ScrollBarPos = 1;
  CurrentFile = "";
  JustifyText = 0;
  FixGutenburg = 0;
  ConvertExt = 0;
  joy->left[0][0] = 2;
  joy->left[0][1] = 19;
  joy->left[1][0] = 19;
  joy->left[1][1] = 19;
  joy->left[2][0] = 19;
  joy->left[2][1] = 19;
  joy->right[0][0] = 6;
  joy->right[0][1] = 19;
  joy->right[1][0] = 19;
  joy->right[1][1] = 19;
  joy->right[2][0] = 19;
  joy->right[2][1] = 19;
  joy->line_up[0][0] = 0;
  joy->line_up[0][1] = 19;
  joy->line_up[1][0] = 19;
  joy->line_up[1][1] = 19;
  joy->line_up[2][0] = 19;
  joy->line_up[2][1] = 19;
  joy->line_down[0][0] = 6;
  joy->line_down[0][1] = 19;
  joy->line_down[1][0] = 19;
  joy->line_down[1][1] = 19;
  joy->line_down[2][0] = 19;
  joy->line_down[2][1] = 19;
  joy->page_up[0][0] = 15;
  joy->page_up[0][1] = 19;
  joy->page_up[1][0] = 19;
  joy->page_up[1][1] = 19;
  joy->page_up[2][0] = 19;
  joy->page_up[2][1] = 19;
  joy->page_down[0][0] = 14;
  joy->page_down[0][1] = 19;
  joy->page_down[1][0] = 19;
  joy->page_down[1][1] = 19;
  joy->page_down[2][0] = 19;
  joy->page_down[2][1] = 19;
  joy->select[0][0] = 13;
  joy->select[0][1] = 19;
  joy->select[1][0] = 19;
  joy->select[1][1] = 19;
  joy->select[2][0] = 19;
  joy->select[2][1] = 19;
  joy->menu[0][0] = 9;
  joy->menu[0][1] = 19;
  joy->menu[1][0] = 19;
  joy->menu[1][1] = 19;
  joy->menu[2][0] = 19;
  joy->menu[2][1] = 19;
  joy->exit[0][0] = 8;
  joy->exit[0][1] = 19;
  joy->exit[1][0] = 19;
  joy->exit[1][1] = 19;
  joy->exit[2][0] = 19;
  joy->exit[2][1] = 19;
  joy->volup[0][0] = 16;
  joy->volup[0][1] = 19;
  joy->volup[1][0] = 19;
  joy->volup[1][1] = 19;
  joy->volup[2][0] = 19;
  joy->volup[2][1] = 19;
  joy->voldown[0][0] = 17;
  joy->voldown[0][1] = 19;
  joy->voldown[1][0] = 19;
  joy->voldown[1][1] = 19;
  joy->voldown[2][0] = 19;
  joy->voldown[2][1] = 19;
  joy->player[0][0] = 16;
  joy->player[0][1] = 17;
  joy->player[1][0] = 19;
  joy->player[1][1] = 19;
  joy->player[2][0] = 19;
  joy->player[2][1] = 19;
  joy->gostart[0][0] = 11;
  joy->gostart[0][1] = 18;
  joy->gostart[1][0] = 19;
  joy->gostart[1][1] = 19;
  joy->gostart[2][0] = 19;
  joy->gostart[2][1] = 19;
  joy->goend[0][0] = 10;
  joy->goend[0][1] = 18;
  joy->goend[1][0] = 19;
  joy->goend[1][1] = 19;
  joy->goend[2][0] = 19;
  joy->goend[2][1] = 19;
  joy->hibernate[0][0] = 12;
  joy->hibernate[0][1] = 18;
  joy->hibernate[1][0] = 19;
  joy->hibernate[1][1] = 19;
  joy->hibernate[2][0] = 19;
  joy->hibernate[2][1] = 19;
  joy->keydelay = 1000;
  joy->keyrepeat = 300;
  joy->lcdshutoff = 120;
  Language = "";
  langDir = 0;
  lang[0] = "Select Doc";
  lang[1] = "Configure";
  lang[2] = "Quit";
  lang[3] = "Loading";
  lang[4] = "Edit Config Settings";
  lang[5] = "Select colour element";
  lang[6] = "change element";
  lang[7] = "change setting";
  lang[8] = "change size";
  lang[9] = "change rotation";
  lang[10] = "change speed";
  lang[11] = "choose option";
  lang[12] = "accept";
  lang[13] = "abandon";
  lang[14] = "No";
  lang[15] = "Yes";
  lang[16] = "Error";
  lang[17] = "Paused";
  lang[18] = "Playing";
  lang[19] = "Stopped";
  lang[20] = "Please wait";
  lang[21] = "select key";
  lang[22] = "Left";
  lang[23] = "Right";

  while (!infil.eof()) {
    getline(infil,line);
    if (line.find('\r') != string::npos) line.erase(line.find('\r'),1);
    option = line.substr(0,line.find("="));
    option = trim(option," ");
    line = line.substr(line.find("=")+1);
    line = trim(line," ");
    line = trim(line,"\"");
    if (option == "DocBase") DocBase = line;
    if (option == "AudioBase") AudioBase = line;
    if (option == "Background") Background = line;
    if (option == "Rotate") Rotate = atoi(line.c_str());
    if (option == "Speed") joy->Speed = atoi(line.c_str());
    if (option == "minSpeed") joy->minSpeed = atoi(line.c_str());
    if (option == "MainFont") MainFont = line;
    if (option == "MainFontSize") MainFontSize = atoi(line.c_str());
    if (option == "MainFontBold") MainFontBold = atoi(line.c_str());
    if (option == "MenuFont") MenuFont = line;
    if (option == "MenuFontSize") MenuFontSize = atoi(line.c_str());
    if (option == "MenuFontBold") MenuFontBold = atoi(line.c_str());
    if (option == "MainBG") {
      TmpCol = line;
      col = "0x" + TmpCol.substr(0,2);
      MainBG[0] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(2,2);
      MainBG[1] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(4,2);
      MainBG[2] = strtol(col.c_str(),NULL,0);  
    }
    if (option == "MainFG") {
      TmpCol = line;
      col = "0x" + TmpCol.substr(0,2);
      MainFG[0] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(2,2);
      MainFG[1] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(4,2);
      MainFG[2] = strtol(col.c_str(),NULL,0);  
    }
    if (option == "StatBarBG") {
      TmpCol = line;
      col = "0x" + TmpCol.substr(0,2);
      StatBarBG[0] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(2,2);
      StatBarBG[1] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(4,2);
      StatBarBG[2] = strtol(col.c_str(),NULL,0);  
    }
    if (option == "MenuHiBG") {
      TmpCol = line;
      col = "0x" + TmpCol.substr(0,2);
      MenuHiBG[0] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(2,2);
      MenuHiBG[1] = strtol(col.c_str(),NULL,0);
      col = "0x" + TmpCol.substr(4,2);
      MenuHiBG[2] = strtol(col.c_str(),NULL,0);  
    }
    if (option == "ScrollBarPos") ScrollBarPos = atoi(line.c_str());
    if (option == "CurrentFile") CurrentFile = line;
    if (option == "JustifyText") JustifyText = atoi(line.c_str());
    if (option == "FixGutenburg") FixGutenburg = atoi(line.c_str());
    if (option == "ConvertExtended") ConvertExt = atoi(line.c_str());
    if (option == "Left") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->left[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->left[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Right") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->right[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->right[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "LineUp") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->line_up[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->line_up[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "LineDown") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->line_down[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->line_down[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "PageUp") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->page_up[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->page_up[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "PageDown") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->page_down[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->page_down[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Select") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->select[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->select[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Menu") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->menu[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->menu[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Exit") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->exit[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->exit[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "VolUp") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->volup[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->volup[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "VolDown") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->voldown[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->voldown[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Player") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->player[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->player[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "GoStart") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->gostart[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->gostart[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "GoEnd") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->goend[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->goend[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Hibernate") {
      TmpKey = line;
      tmpkeys.clear();
      Tokenise(TmpKey,tmpkeys,",");
      for (unsigned int i = 0;i < 3; i++) {
        if (tmpkeys.size() > i) {
          if (tmpkeys[i].find("+") != string::npos) {
            tmpS = tmpkeys[i].substr(tmpkeys[i].find("+")+1);
            tmpkeys[i].erase(tmpkeys[i].find("+"));
          } else {
            tmpS = "19";
          }
          joy->hibernate[i][0] = strtol(tmpkeys[i].c_str(),NULL,0);
          joy->hibernate[i][1] = strtol(tmpS.c_str(),NULL,0);
        }
      }
    }
    if (option == "Language") Language = line;
    if (option == "KeyDelay") joy->keydelay = atoi(line.c_str());
    if (option == "KeyRepeat") joy->keyrepeat = atoi(line.c_str());
    if (option == "LCDShutOff") joy->lcdshutoff = atoi(line.c_str());
    
  }
  infil.close();
  if (!Background.empty()) {
    //printf("%s\n",Background);
    loadBackground(Background);

  }
  if (Rotate != 0 && Rotate != 90 && Rotate != 180 && Rotate != 270) {
    Rotate = 0;
  }
  if (Rotate == 0 || Rotate == 180) {
    w = 320;
    h = 240;
  } else {
    w = 240;
    h = 320;    
  }
  if (canvas != NULL) {
    SDL_FreeSurface(canvas);
  }
  canvas = SDL_CreateRGBSurface(SDL_SWSURFACE,w,h,32,0, 0, 0, 0);
  
  if (joy->Speed < 50) joy->Speed = 50;
  if (joy->Speed > 250) joy->Speed = 250;
#ifdef GP2X
  if (joy->Speed > 0) {
    SetClock(joy->Speed);
  }
#endif

  if (joy->minSpeed < 50) joy->minSpeed = 50;
  if (joy->minSpeed > 250) joy->minSpeed = 250;

  if (mainfont != NULL) {
    TTF_CloseFont(mainfont);
  }
  mainfont = TTF_OpenFont(MainFont.c_str(), MainFontSize);
  if (MainFontBold == 1) {
    TTF_SetFontStyle(mainfont,TTF_STYLE_BOLD);
  }
  mainrowheight = TTF_FontHeight(mainfont);
  if (menufont != NULL) {
    TTF_CloseFont(menufont);
  }
  menufont = TTF_OpenFont(MenuFont.c_str(), MenuFontSize);
  if (MenuFontBold == 1) {
    TTF_SetFontStyle(menufont,TTF_STYLE_BOLD);
  }
  menurowheight = TTF_FontHeight(menufont);

  maxlines = (h / mainrowheight);
  
  if (!Language.empty() && fileExists(Language)) {
    ifstream langfil(Language.c_str());
    getline(langfil,line);
    if (line.find('\r') != string::npos) line.erase(line.find('\r'),1);
    if (line == "L") {
      langDir = 0;
    } else {
      langDir = 1;
    } 
    for (int i = 0;i < 24; i++) {
      if (!langfil.eof()) {
        getline(langfil,line);
        if (line.find('\r') != string::npos) line.erase(line.find('\r'),1);
        if (!line.empty()) {
          lang[i] = line;
        }
      }
    }
    langfil.close();
  }
}

void TScrn::savecfg(string section, string item, string value) {
  string tmpS;
  vector<string> cfgfile;
  string line, option;
  ifstream infil("greader2x.cfg");
  while (!infil.eof()) {
    getline(infil,line);
    cfgfile.push_back(line);
  }
  infil.clear();
  infil.close();
  for (vector<string>::iterator i = cfgfile.begin(); i != cfgfile.end(); ++i) {
    tmpS = *(i);
    if (tmpS.substr(0,item.size()) == item) {
      *(i) = item + "=" + "\"" + value + "\"";
    }
  }
  ofstream ofl("greader2x.cfg");
  if (ofl.is_open()) {
    for (vector<string>::iterator i = cfgfile.begin(); i != cfgfile.end(); ++i) {
      ofl << (*i) << "\n";
    }
    ofl.close();
  } else {
    fprintf(stderr,"Error %d, %d\r\n",ofl.fail(), ofl.bad());
  }
}

void TScrn::waitMessage(void) {
  Clear();
  drawRoundrect(w/2-40,h/2-menurowheight,80,3 * menurowheight,3,StatBarBG);
  drawText(w/2-36,h/2-(menurowheight/2),lang[20]+"...",menufont);
  Flip();
}
