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
#ifndef JOYSTICK_H
#define JOYSTICK_H

#include <SDL.h>
#include <vector>
#include "utils.h"

using std::vector;


enum MAP_KEY
{
	VK_UP         , // 0
	VK_UP_LEFT    , // 1
	VK_LEFT       , // 2
	VK_DOWN_LEFT  , // 3
	VK_DOWN       , // 4
	VK_DOWN_RIGHT , // 5
	VK_RIGHT      , // 6
	VK_UP_RIGHT   , // 7
	VK_START      , // 8
	VK_SELECT     , // 9
	VK_FL         , // 10
	VK_FR         , // 11
	VK_FA         , // 12
	VK_FB         , // 13
	VK_FX         , // 14
	VK_FY         , // 15
	VK_VOL_UP     , // 16
	VK_VOL_DOWN   , // 17
	VK_TAT          // 18
};


class Joystick {
private:
  int numButtons;
  int pressed[20];
  bool buttons[20];
  int interval[20];
  SDL_Joystick *stick;
  int numpressed;
  bool isKey(int key[3][2]);
  int lcdstart;
public:
  int left[3][2];
  int right[3][2];
  int line_up[3][2];
  int line_down[3][2];
  int page_up[3][2];
  int page_down[3][2];
  int select[3][2];
  int exit[3][2];
  int menu[3][2];
  int player[3][2];
  int volup[3][2];
  int voldown[3][2];
  int gostart[3][2];
  int goend[3][2];
  int hibernate[3][2];
  int keydelay;
  int keyrepeat;
  int lcdshutoff;
  bool LcdOn;
  int Speed;
  int minSpeed;
  Joystick();
  ~Joystick();
  void init(void);
  bool Button(int but);
  void Check(void);
  bool isUp(void);
  bool isDn(void);
  bool isLeft(void);
  bool isRight(void);
  bool isPgup(void);
  bool isPgdn(void);
  bool isSelect(void);
  bool isExit(void);
  bool isMenu(void);
  bool isPlayer(void);
  bool isVolup(void);
  bool isVoldown(void);
  bool isGostart(void);
  bool isGoend(void);
  bool isHibernate(void);
};

#endif
