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
#ifndef CONFED_H
#define CONFED_H

#include <string>
#include <fstream>
#include <sstream>
#include <vector>
#include "screen.h"

using std::string;
using std::vector;

class Tconfigeditor {
private:
  TScrn* scrn;
  vector<string> cfgfile;
  vector<string> options;
  vector<string> values;
  void extractOptions(void);
public:
  Tconfigeditor(TScrn* sc);
  void readIni(void);
  void showIni(void);
  void writeIni(void);
  void editOption(string &name, string &val);
  void editFile(string ext, string& v);
  void editDir(string& v);
  void editColour(string &n, string &v);
  void editKey(string &n, string &v);
  void editBool(string &n, string &v);
  void editSize(string &n, string &v);
  void editRotate(string &n, string &v);
  void editSpeed(string &n, string &v);
  void editTimings(string &n, string &v);
  void editLCDShutOff(string &n, string &v);
};

#endif
