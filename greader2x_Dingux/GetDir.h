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
#ifndef GETDIR_H
#define GETDIR_H

#include <string>
#include <dirent.h>
#include <iostream>
#include <vector>
#include "screen.h"

using std::string;
using std::vector;


class GetDir {
private:
  vector<string> files;
  vector<char> isdir;
  vector<string> extensions;
  TScrn* scrn;
  bool isDir(string str);
public:
  bool addNone;
  GetDir(TScrn* sc);
  void Scan(string dir, bool zp);
  void scanDirs(string dir);
  void scanFiles(string dir);
  string Item(int index);
  int Count(void);
  void AddExt(string extension);
  void RemExt(string extension);
  int Show(string& str, bool path);
  int showDirs(string& str);
};

#endif
