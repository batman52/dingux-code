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
#ifndef SCREEN_H
#define SCREEN_H

#include <SDL.h>
#include <SDL_ttf.h>
#include <SDL_image.h>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <math.h>
#include "joystick.h"

using std::string;

class TScrn {
private:
  SDL_Surface *screen;
  SDL_Surface *canvas;
  SDL_Surface *background;
public:
  Joystick* joy;
  int w,h;
  string MainFont;
  int MainFontSize;
  int MainFontBold;
  string MenuFont;
  int MenuFontSize;
  int MenuFontBold;
  int MainFG[3];
  int MainBG[3];
  int StatBarBG[3];
  int MenuHiBG[3];
  int Rotate;
  string CurrentFile;
  string DocBase;
  string AudioBase;
  string Background;
  int JustifyText;
  int FixGutenburg;
  int ScrollBarPos;
  int ConvertExt;
  string Language;
  string lang[24];
  int langDir;
  int mainrowheight;
  int menurowheight;
  int maxlines;
  TTF_Font* mainfont;
  TTF_Font* menufont;

  TScrn(Joystick* jy);
  ~TScrn();
  void init(void);
  void Clear(void);
  void Flip(void);
  void loadBackground(string bg); 
  void drawText(int x, int y, string str, TTF_Font *font);
  void drawCliptext(int x, int y, int w, int h, string str, TTF_Font *font);
  void drawInt(int x, int y, int number, TTF_Font *font);
  void drawRect(int x, int y, int w, int h, int col[3]);
  int sizeText(string str, TTF_Font *font);
  void drawRoundrect(int xo, int yo, int w, int h, int r, int col[3]);
  SDL_Surface* Rotate90(SDL_Surface* src);
  SDL_Surface* Rotate180(SDL_Surface* src);
  SDL_Surface* Rotate270(SDL_Surface* src);
  void loadcfg(void);
  void savecfg(string section, string item, string value);
  void waitMessage(void);
};

#endif

