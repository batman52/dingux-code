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
#include <string>

#include "GetDir.h"
#include "contrib/unzip.h"
#include <algorithm>
#include <sys/types.h>
#include <sys/stat.h>

GetDir::GetDir(TScrn* sc) {
  scrn = sc;
  addNone = false;
};

void GetDir::Scan(string dir, bool zp) {
  string tmpS;
  int NumFiles;

  files.clear();
  isdir.clear();
  if (zp) {
    char fn[255];
	unzFile zip;
	unz_global_info ginfo;
    zip = unzOpen(dir.c_str());
    if (zip) {
      unzGetGlobalInfo(zip,&ginfo);
      unzGoToFirstFile(zip);
      files.push_back("0.");
      files.push_back("0..");
      for (unsigned int i = 0;i < ginfo.number_entry;i++) {
        unzGetCurrentFileInfo (zip,NULL,fn,255,NULL,0,NULL,0);
        tmpS = fn;
        for (unsigned int i2 = 0; i2 < extensions.size(); i2++) {
          if (tmpS.find(extensions[i2],0) != string::npos && tmpS.find(".zip",0) == string::npos) {
            files.push_back("1"+tmpS);
          }
        }
        unzGoToNextFile(zip);
      }
      NumFiles = files.size();
      unzClose(zip);
    }
  } else {
    DIR *pdir;
    struct dirent *pent;
    bool kept = false;
     
    pdir=opendir(dir.c_str());
    while ((pent=readdir(pdir))) {
      kept = false;
      tmpS = lcase(pent->d_name);
      for (unsigned int i2 = 0; i2 < extensions.size(); i2++) {
        if (tmpS.find(extensions[i2],0) != string::npos) {
          kept = true;
          if (tmpS.find(".zip") == tmpS.size()-4) {
            tmpS = pent->d_name;
            tmpS = "0" + tmpS;
          } else {
            tmpS = pent->d_name;
            tmpS = "1" + tmpS;
          }
          files.push_back(tmpS);
        }
      }
      if (!kept) {
        tmpS = pent->d_name;
        if (isDir(dir + "/" + tmpS)) {
          files.push_back("0"+tmpS);
        }
      }
    }
    NumFiles = files.size();
    closedir(pdir);
  }
  sort(files.begin(), files.end());
  for (int i = 0;i<(int)files.size();i++) {
    if (files[i].substr(0,1) == "0") {
      isdir.push_back(1);
    } else {
      isdir.push_back(0);
    }
    files[i].erase(0,1);
  }
  if (addNone) {
    files.push_back("<None>");
    isdir.push_back(0);
  }
};

void GetDir::scanFiles(string dir) {
  string tmpS;
  DIR *pdir;
  struct dirent *pent;
     
  files.clear();
  isdir.clear();
  pdir=opendir(dir.c_str());
  files.push_back(".");
//  files.push_back("/");
  isdir.push_back(0);
  while ((pent=readdir(pdir))) {
    tmpS = lcase(pent->d_name);
    for (unsigned int i2 = 0; i2 < extensions.size(); i2++) {
      if (tmpS.find(extensions[i2],0) != string::npos) {
        files.push_back(pent->d_name);
        isdir.push_back(0);
      }
    }
  }
  closedir(pdir);
  sort(files.begin(), files.end());
};

void GetDir::scanDirs(string dir) {
  string tmpS;
  DIR *pdir;
  struct dirent *pent;
  bool kept = false;
     
  files.clear();
  isdir.clear();
  pdir=opendir(dir.c_str());
  while ((pent=readdir(pdir))) {
    kept = false;
    tmpS = pent->d_name;
    if (isDir(dir + "/" + tmpS)) {
      files.push_back(tmpS);
      isdir.push_back(1);
    }
  }
  closedir(pdir);
  files.push_back("<Select>");
  isdir.push_back(0);
};

string GetDir::Item(int index) {
  return files[index];
}

int GetDir::Count(void) {
  return files.size();
}

void GetDir::AddExt(string extension) {
  extensions.push_back(lcase(extension));     
}

int GetDir::Show(string& str, bool path) {
  SDL_Rect rect = {2,2,scrn->w-6,scrn->menurowheight};
  int numfiles = files.size();
  string curdir = str;
  int topitem = 1;
  int maxitems;
  int done = 999;
  int retval = 0;
  bool redraw = true;
  string tmpS;

  int curOpt = 0;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      rect.x = 2;
      rect.w = scrn->w-6;
      rect.h = scrn->menurowheight;
      maxitems = ((scrn->h-52) / scrn->menurowheight);
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext(4,2,scrn->w-6,scrn->menurowheight, curdir, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-32,4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-34,4,scrn->MainBG);
      rect.y = rect.h + 10;
      rect.x += 2;
      rect.w -= 4;
      scrn->drawRect(rect.x,curOpt * rect.h + rect.h + 10,rect.w,rect.h,scrn->MenuHiBG);

      for (int i = 0; i <= maxitems; i++) {
        if (topitem + i < numfiles) {
          if (isdir[topitem + i] == 1) {
            tmpS = "[" + files[topitem + i] + "]";
          } else {
            tmpS = files[topitem + i];
          }
          scrn->drawCliptext(6,rect.y + i * rect.h,rect.w-2,rect.h, tmpS , scrn->menufont);
        }
      }
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      if (--curOpt < 0) {
        curOpt = 0;
        if (topitem > 1) topitem--;
      }
      redraw = true;
    } else if (scrn->joy->isDn()) {
      if (topitem + curOpt < numfiles-1) {
        if (++curOpt > maxitems) {
          curOpt--;
          if (topitem + maxitems < numfiles-1) topitem++;
        }
      }
      redraw = true;
    } else if (scrn->joy->isPgup()) {
      topitem -= maxitems;
      if (topitem < 1) {
        topitem = 1;
      }
      redraw = true;
    } else if (scrn->joy->isPgdn()) {
      topitem += maxitems;
      if (topitem > numfiles) {
        topitem = numfiles-1;
      }
      if (topitem + curOpt > numfiles) {
        curOpt = numfiles - topitem;
      }
      redraw = true;
    } else if (scrn->joy->isGostart()) {
      topitem = 1;
      curOpt = 0;
      redraw = true;
    } else if (scrn->joy->isGoend()) {
      topitem = numfiles-maxitems;
      if (topitem < 1) topitem = 1;
      curOpt = numfiles-topitem-1;
      redraw = true;
    } else if (scrn->joy->isSelect()) {
      if (files[topitem + curOpt] == "..") {
        if (curdir != str) {
          curdir.erase(curdir.rfind("/"));
        }
      } else {
        curdir = curdir + "/" + files[topitem + curOpt];
      }
      if (curdir.find("<None>") == string::npos && isDir(curdir)) {
        Scan(curdir.c_str(),false);
        numfiles = files.size();
        topitem = 1;
        curOpt = 0;
      } else {
        tmpS = files[topitem + curOpt];
        if (tmpS.substr(tmpS.size()-4) == ".zip") {
          Scan(curdir.c_str(),true);
          numfiles = files.size();
          topitem = 1;
          curOpt = 0;
        } else {
          if (path) {
            str = curdir;
          } else {
            str = curdir.substr(curdir.rfind("/")+1);
          }
          retval = 1;
          done = -1;
        }
      }
      redraw = true;
    } else if (scrn->joy->isExit()) {
      retval = 0;
      done=-1;
    } else if (scrn->joy->isMenu()) {
      retval = 2;
      done = -1;
    }
  }
  return retval;
}

int GetDir::showDirs(string& str) {
  SDL_Rect rect = {2,2,scrn->w-6,scrn->menurowheight};
  int numfiles = files.size();
  string curdir = str;
  int topitem = 1;
  int maxitems;
  int done = 999;
  int retval = 0;
  bool redraw = true;
  string tmpS;

  int curOpt = 0;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      rect.x = 2;
      rect.w = scrn->w-6;
      rect.h = scrn->menurowheight;
      maxitems = ((scrn->h-52) / scrn->menurowheight);
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext(4,2,scrn->w-6,scrn->menurowheight, curdir, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-32,4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-34,4,scrn->MainBG);
      rect.y = rect.h + 10;
      rect.x += 2;
      rect.w -= 4;
      scrn->drawRect(rect.x,curOpt * rect.h + rect.h + 10,rect.w,rect.h,scrn->MenuHiBG);

      for (int i = 0; i <= maxitems; i++) {
        if (topitem + i < numfiles) {
          if (isdir[topitem + i] == 1) {
            tmpS = "[" + files[topitem + i] + "]";
          } else {
            tmpS = files[topitem + i];
          }
          scrn->drawCliptext(6,rect.y + i * rect.h,rect.w-2,rect.h, tmpS , scrn->menufont);
        }
      }
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      if (--curOpt < 0) {
        curOpt = 0;
        if (topitem > 1) topitem--;
      }
      redraw = true;
    } else if (scrn->joy->isDn()) {
      if (topitem + curOpt < numfiles-1) {
        if (++curOpt > maxitems) {
          curOpt--;
          if (topitem + maxitems < numfiles-1) topitem++;
        }
      }
      redraw = true;
    } else if (scrn->joy->isPgup()) {
      topitem -= maxitems;
      if (topitem < 1) {
        topitem = 1;
      }
      redraw = true;
    } else if (scrn->joy->isPgdn()) {
      topitem += maxitems;
      if (topitem > numfiles) {
        topitem = numfiles-1;
      }
      if (topitem + curOpt > numfiles) {
        curOpt = numfiles - topitem;
      }
      redraw = true;
    } else if (scrn->joy->isGostart()) {
      topitem = 1;
      curOpt = 0;
      redraw = true;
    } else if (scrn->joy->isGoend()) {
      topitem = numfiles-maxitems;
      if (topitem < 1) topitem = 1;
      curOpt = numfiles-topitem-1;
      redraw = true;
    } else if (scrn->joy->isSelect()) {
      if (files[topitem + curOpt] == "..") {
        if (curdir != str) {
          curdir.erase(curdir.rfind("/"));
        }
      } else {
        curdir = curdir + "/" + files[topitem + curOpt];
      }
      if (curdir.find("<Select>") == string::npos) {
        scanDirs(curdir.c_str());
        numfiles = files.size();
        topitem = 1;
        curOpt = 0;
      } else {
        str = curdir;
        retval = 1;
        done = -1;
      }
      redraw = true;
    } else if (scrn->joy->isExit()) {
      retval = 0;
      done=-1;
    } else if (scrn->joy->isMenu()) {
      retval = 2;
      done = -1;
    }
  }
  return retval;
}

bool GetDir::isDir(string str) {
  struct stat statbuf;
  stat(str.c_str(), &statbuf);
  if ( 0 != (statbuf.st_mode & S_IFDIR) ) {
    return true;
  } else {
    return false;
  }
}
