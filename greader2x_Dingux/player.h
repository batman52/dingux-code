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
#ifndef PLAYER_H
#define PLAYER_H

#include <SDL.h>
#include <SDL_mixer.h>
#include <vector>
#include "screen.h"

class TPlayer {
private:
  Mix_Music *music;
  TScrn* scrn;
  vector<string> playlist;
  int currentTrack;
  int volume;
  bool paused;
  static void songEnded(void);
  void nextSong(void);
  void drawButton(int but, int x, int y, bool hi);
  void drawVolume(void);
public:
  bool playing;
  TPlayer(TScrn *sc);
  ~TPlayer();
  void init(string dir);
  void loadFile(string fl);
  void play(void);
  void pause(void);
  void stop(void);
  void changeVolume(int vol);
  void show(void);
};

#endif
