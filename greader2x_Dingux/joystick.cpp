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
#include "joystick.h"
#include "utils.h"

using namespace std;

Joystick::Joystick() {
  numButtons = 20;
  LcdOn = true;
  for (int i=0; i<numButtons; i++) {
	buttons[i] = false;
	pressed[i] = 0;
	interval[i] = keydelay;
  }
}

Joystick::~Joystick() {
	SDL_JoystickClose(stick);
}

void Joystick::init(void) {
  SDL_JoystickEventState(SDL_IGNORE);
  stick = NULL;
  if (SDL_NumJoysticks() > 0) {
    stick = SDL_JoystickOpen(0);
    if(!stick) {
	  fprintf (stderr, "Couldn't open joystick 0: %s\n", SDL_GetError ());
    }
  }
  lcdstart = SDL_GetTicks();
}

bool Joystick::Button(int but) {
  return buttons[but];
}

void Joystick::Check(void) {
  numpressed = 0;

#ifdef GP2X
  SDL_JoystickUpdate();
  for (int inc=0; inc<19; inc++) {
    buttons[inc] = false;
    if (SDL_JoystickGetButton(stick,inc)) {
      buttons[inc] = true;
      numpressed++;
    } else {
      pressed[inc] = 0;
      interval[inc] = 0;
    }
  }
  int tick = SDL_GetTicks();
  if (numpressed == 0) {
    if (tick - lcdstart > (lcdshutoff * 1000) && LcdOn) {
      LcdOn = disablelcd();
      if (minSpeed > 0) {
        SetClock(minSpeed);
      }
    }
  } else {
    if (!LcdOn) {
      if (Speed > 0) {
        SetClock(Speed);
      }
      LcdOn = enablelcd();
    }
    lcdstart = tick;
  }
#endif

#ifndef GP2X
  Uint8 *keystate;
//  int tick = SDL_GetTicks();
  for (int inc=0; inc<19; inc++) {
    buttons[inc] = false;
  }
  SDL_PumpEvents();
  keystate = SDL_GetKeyState(NULL);
  if ( keystate[SDLK_LEFT] ) {
    buttons[VK_LEFT] = true;
    numpressed++;
  } else {
    pressed[VK_LEFT] = 0;
    interval[VK_LEFT] = 0;
  }
  if ( keystate[SDLK_RIGHT] ) {
    buttons[VK_RIGHT] = true;
    numpressed++;
  } else {
    pressed[VK_RIGHT] = 0;
    interval[VK_RIGHT] = 0;
  }
  if ( keystate[SDLK_UP] ) {
    buttons[VK_UP] = true;
    numpressed++;
  } else {
    pressed[VK_UP] = 0;
    interval[VK_UP] = 0;
  }

  if ( keystate[SDLK_SPACE] ) {
    buttons[VK_FY] = true;
    numpressed++;
  } else {
    pressed[VK_FY] = 0;
    interval[VK_FY] = 0;
  }
  if ( keystate[SDLK_DOWN] ) {
    buttons[VK_DOWN] = true;
    numpressed++;
  } else {
    pressed[VK_DOWN] = 0;
    interval[VK_DOWN] = 0;
  }
  if ( keystate[SDLK_LSHIFT] ) {
    buttons[VK_FX] = true;
    numpressed++;
  } else {
    pressed[VK_FX] = 0;
    interval[VK_FX] = 0;
  }
  if ( keystate[SDLK_LALT]) {
    buttons[VK_FB] = true;
    numpressed++;
  } else {
    pressed[VK_FB] = 0;
    interval[VK_FB] = 0;
  }
  if ( keystate[SDLK_RETURN] ) {
    buttons[VK_START] = true;
    numpressed++;
  } else {
    pressed[VK_START] = 0;
    interval[VK_START] = 0;
  }
  if ( keystate[SDLK_ESCAPE] ) {
    buttons[VK_SELECT] = true;
    numpressed++;
  } else {
    pressed[VK_SELECT] = 0;
    interval[VK_SELECT] = 0;
  }
  if ( keystate[SDLK_BACKSPACE] ) {
    buttons[VK_VOL_DOWN] = true;
    numpressed++;
  } else {
    pressed[VK_VOL_DOWN] = 0;
    interval[VK_VOL_DOWN] = 0;
  }
  if ( keystate[SDLK_TAB] ) {
    buttons[VK_VOL_UP] = true;
    numpressed++;
  } else {
    pressed[VK_VOL_UP] = 0;
    interval[VK_VOL_UP] = 0;
  }
  if ( keystate[SDLK_LCTRL] ) {
    buttons[VK_FA] = true;
    numpressed++;
  } else {
    pressed[VK_FA] = 0;
    interval[VK_FA] = 0;
  }
#endif
}

bool Joystick::isKey(int key[3][2]) {
  bool res = false;
  int tick = SDL_GetTicks();
  for (int i = 0; i < 3; i++) {
    if (buttons[key[i][0]]) {
      if (key[i][1] == 19 && numpressed == 1 || buttons[key[i][1]]) {
        if (tick-pressed[key[i][0]]>interval[key[i][0]]) {
          pressed[key[i][0]] = tick;
          if (interval[key[i][0]] == 0) {
            interval[key[i][0]] = keydelay;
          } else {
            interval[key[i][0]] = keyrepeat;
          }
          res = true;
        }
      }
    }
  }
  return res;

}

bool Joystick::isUp(void) {
  return isKey(line_up);
}

bool Joystick::isDn(void) {
  return isKey(line_down);
}

bool Joystick::isPgup(void) {
  return isKey(page_up);
}

bool Joystick::isPgdn(void) {
  return isKey(page_down);
}

bool Joystick::isSelect(void) {
  return isKey(select);
}

bool Joystick::isExit(void) {
  return isKey(exit);
}

bool Joystick::isMenu(void) {
  return isKey(menu);
}

bool Joystick::isLeft(void) {
  return isKey(left);
}

bool Joystick::isRight(void) {
  return isKey(right);
}

bool Joystick::isPlayer(void) {
  return isKey(player);
}

bool Joystick::isVolup(void) {
  return isKey(volup);
}

bool Joystick::isVoldown(void) {
  return isKey(voldown);
}

bool Joystick::isGostart(void) {
  return isKey(gostart);
}

bool Joystick::isGoend(void) {
  return isKey(goend);
}

bool Joystick::isHibernate(void) {
  return isKey(hibernate);
}
