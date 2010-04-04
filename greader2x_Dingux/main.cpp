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

#include <string.h>
#include <unistd.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <SDL.h>
#include <SDL_ttf.h>
#include <SDL_image.h>
#include <sstream>
#include <map>
#include <functional>
#include <algorithm>

#include "GetDir.h"
#include "contrib/unzip.h"
#include "utils.h"
#include "screen.h"
#include "joystick.h"
#include "player.h"
#include "conf_ed.h"
using std::string;
//using namespace std;

bool wrapPageup(bool lineonly);

Joystick myjoystick;
TScrn myscreen(&myjoystick);
TPlayer player(&myscreen);
Tconfigeditor conf(&myscreen);

vector<string> ebook;

int linepos, charpos;
int nextlinepos, nextcharpos;

void Terminate(void)
{
  TTF_Quit();
  SDL_Quit();
//	chdir("/usr/local");
//	execl("/usr/local/dmenu", "/usr/local/dmenu", NULL);
//return -1;
}

int ShowMenu(void) {
  string opts[3] = {"  "+myscreen.lang[0]+"  ","  "+myscreen.lang[1]+"  ","  "+myscreen.lang[2]+"  "};
  SDL_Rect rect;
  int done = 999;
  int sz;
  string TmpS;
  int curopt, retval = 0;
  bool redraw = true;
  rect.w = 0;
  for (int i = 0;i< 3;i++) {
    sz = myscreen.sizeText(opts[i].c_str(),myscreen.menufont);
    if (rect.w < sz) rect.w = sz;
  }
  rect.x = (myscreen.w - rect.w) / 2;
  int topitem = (myscreen.h - (4 * myscreen.menurowheight)) / 2;
  rect.h = myscreen.menurowheight;
  
  curopt = 0;
  while (done != -1) {
    if (redraw) {
      rect.y = topitem;
      myscreen.drawRoundrect(rect.x-1,rect.y-1,rect.w+2,(rect.h*4)+2,4,myscreen.MainFG);
      myscreen.drawRoundrect(rect.x,rect.y,rect.w,(rect.h*4),4,myscreen.MainBG);
      
      for (int i = 0; i < 3; i++) {
        TmpS = opts[i];
        rect.y = topitem+(i * rect.h);
        if (i == curopt) {
          myscreen.drawRect(rect.x,rect.y+(rect.h/2),rect.w,rect.h,myscreen.MenuHiBG);  
        }
        myscreen.drawText(rect.x,rect.y+(rect.h/2), TmpS, myscreen.menufont);
      }
      myscreen.Flip();
      redraw = false;
    }

    myjoystick.Check();
    
    if (myjoystick.isUp()) {
      if (--curopt < 0) curopt = 2;
      redraw = true;          
    } else if (myjoystick.isDn()) {
      if (++curopt > 2) curopt = 0;
      redraw = true;          
    } else if (myjoystick.isPlayer()) {
      player.show();
      redraw = true;
    } else if (myjoystick.isVolup()) {
      player.changeVolume(5);
      redraw = true;
    } else if (myjoystick.isVoldown()) {
      player.changeVolume(-5);
      redraw = true;
    } else if (myjoystick.isSelect()) {
      if (curopt == 0) {
        retval = 1;
      } else if (curopt == 1) {
        conf.readIni();
        conf.showIni();
        conf.writeIni();
        myscreen.loadcfg();
        player.init(myscreen.AudioBase);
        retval = 0;
      } else if (curopt == 2) {
        retval = -1;
      }
      done = -1;            
    } else if (myjoystick.isExit()) {
      retval = 0;
      done = -1;
    }
  }  
  return retval;
}

void FixGutenburg(vector<string> &in, vector<string> &out) {
  vector<string> res;
  string line,nextline;
  bool eol = false;
  
  for (int i = 0; i < (int)in.size(); i++) {
    nextline = in[i];
    if (nextline.empty()) {
      if (eol) {
        res.push_back(line);
        line.clear();
      }
      res.push_back("");
      eol = false;
    } else {
      if (nextline[0] == ' ') {
        res.push_back(line);
        line.clear();
      }
      if (line.empty()) {
        line = in[i];
      } else {
        line += " " + in[i];
      }
      eol = true;
    }
  }  
  if (!line.empty()) {
    res.push_back(line);
  }
  out = res;   
}

void ParseFile(void) {
  string readline, nextline;
  int booksize;
  string sbuf;
  char *buf;
  SDL_Rect rect = {(myscreen.w - 120) / 2,(myscreen.h - 60) / 2,120,60};
  myscreen.Clear();
  myscreen.drawRoundrect(rect.x,rect.y,rect.w,rect.h,3,myscreen.StatBarBG);
  myscreen.drawText(rect.x+2,rect.y+2, myscreen.lang[3]+"...", myscreen.menufont);
  rect.x += 5;
  rect.y += 25;
  rect.h = 20;
  rect.w = 110;
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.MainBG);
  myscreen.Flip();
  ebook.clear();

  if (myscreen.CurrentFile.find(".zip") != string::npos) {
  	unzFile  zip;
  	string zipname,fn, line;
  	unz_file_info info;
  	int numread;
  	zipname = myscreen.CurrentFile.substr(0,myscreen.CurrentFile.rfind("/"));
    zip = unzOpen(zipname.c_str());
    if (zip != NULL) {
      fn = myscreen.CurrentFile.substr(myscreen.CurrentFile.rfind("/")+1);
      if (unzLocateFile(zip, fn.c_str(), 0) == 0) {
        unzGetCurrentFileInfo( zip, &info, NULL, 0, NULL, 0, NULL, 0 );
        unzOpenCurrentFile (zip);
        buf = (char*)malloc(info.uncompressed_size);
        sbuf = "";
        numread = unzReadCurrentFile (zip, buf, info.uncompressed_size);
        sbuf.assign(buf,info.uncompressed_size);
        SplitLines((myscreen.ConvertExt == 1), sbuf,ebook,"\n");
        free(buf);
        unzClose(zip);
      }
    }
  } else {
    ifstream fl(myscreen.CurrentFile.c_str(),ios::binary);
    fl.seekg(0, ios::end);
    booksize = fl.tellg();
    fl.seekg (0, ios::beg);
    buf = (char*)malloc(booksize);
    sbuf = "";
    fl.read(buf,booksize);
    sbuf.assign(buf,booksize);
    SplitLines((myscreen.ConvertExt == 1),sbuf,ebook,"\n");
    free(buf);
    fl.close();
  }
  
  rect.w = 55;
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.MenuHiBG);
  myscreen.Flip();

  if (myscreen.FixGutenburg == 1) {
    FixGutenburg(ebook,ebook);
  }

  rect.w = 110;
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.MenuHiBG);
  myscreen.Flip();
  
}

bool GetFile(void) {
  string tmpS = myscreen.DocBase;
  int res = 2;
  int done = 999;
  GetDir dir(&myscreen);
  dir.AddExt(".txt");
  dir.AddExt(".zip");
  dir.Scan(tmpS, false);
  while (done != -1) {
    res = dir.Show(tmpS, true);
    if (res == 2){
      done = ShowMenu();
    }
    if (res == 0){
      done =-1;
    }
    if (res == 1){
      done =-1;
    }
  }
  if (res == 1) {
    myscreen.CurrentFile = tmpS;
    myscreen.savecfg("Main","CurrentFile",myscreen.CurrentFile);
    sync();
    return true;
  } else {
    return false;
  }
}

void WrapLine(string line, vector<string> &out) {
  vector<string> res;
  string nextline;
  unsigned int minsize, maxsize, midsize;
  unsigned int lastspace;
  unsigned int linesize, linelen;

  minsize = (myscreen.w - 4) / myscreen.sizeText("W",myscreen.mainfont);
  maxsize = (myscreen.w - 4) / myscreen.sizeText("i",myscreen.mainfont);
  midsize = (myscreen.w - 4) / myscreen.sizeText("s",myscreen.mainfont) + 10;


  linesize = wLen(line);
  if (linesize < minsize) {
    res.push_back(line);
  } else {
    while (linesize > 0) {
      if (linesize <= maxsize) {
        linelen = myscreen.sizeText(line, myscreen.mainfont);
      } else {
        linelen = (myscreen.w - 3);
      }
      lastspace = line.size();
      if (linelen <= (unsigned)(myscreen.w - 4)) {
        res.push_back(line);
        linesize=0;
      } else {
        while ( linelen > (unsigned)(myscreen.w - 4) ) {
          if (lastspace > midsize) {
            lastspace = line.rfind(' ',midsize);
          } else {
            lastspace = line.rfind(' ',lastspace-1);
          }
          if (lastspace == string::npos) lastspace=minsize;
          nextline = line.substr(0,lastspace);
          linelen = myscreen.sizeText(nextline, myscreen.mainfont);
        }
        res.push_back(nextline);
        line.erase(0,lastspace+1);
        linesize = wLen(line);
        nextline.clear();
      }
    }
  }
  out = res;
}

/* TODO (Coder#1#): Fix rendering of Arabic text */
void drawLine(string str,int x,int y, bool justify) {
  int numsp = count(str.begin(), str.end(), ' ');
 // int numsp = 10;
  int spz;
  int tot = 0;
  vector<string> tokens;
  string tmpStr;
  
  tmpStr = str;
  if (myscreen.langDir == 1) {
    tmpStr = bidify(str);
  }
  
  string ch;
  if (justify) {
    Tokenise(tmpStr,tokens, " ");
    for (unsigned int i = 0; i < tokens.size(); i++) {
      tot = tot + myscreen.sizeText(tokens[i], myscreen.mainfont);
    }
    if (numsp > 0) {
      spz = ((myscreen.w - 4) - tot) / numsp;
    } else {
      spz = 0;
    }
    int decval = (myscreen.w - 4) - tot - (numsp * spz);
    if (decval > 0) {
      spz++;
    } else {
      decval = 999;   
    }
    for (unsigned int i = 0; i < tokens.size(); i++) {
      myscreen.drawText(x,y,tokens[i], myscreen.mainfont);     
      x = x + myscreen.sizeText(tokens[i], myscreen.mainfont) + spz;
      if (--decval == 0) spz--;
    }
  } else {
    if (myscreen.langDir == 1) {
      myscreen.drawText(myscreen.w-myscreen.sizeText(tmpStr,myscreen.mainfont)-x,y,tmpStr, myscreen.mainfont);
    } else {
      myscreen.drawText(x,y,tmpStr, myscreen.mainfont);
    }
  }
}

bool wrapPagedown(bool lineonly) {
  vector<string> tmplines;
  bool res = true;
  int screenline = 0;
  unsigned int i;
  int linex = 0;
  SDL_Rect rect = {myscreen.w-2,0,2,myscreen.h};
  int barpos = linepos * (myscreen.h) / ebook.size();
  if (myscreen.ScrollBarPos == 0) {
    linex = 4;
    rect.x = 0;
  }
  if (linepos < (int)ebook.size() && charpos > (int)ebook[linepos].size()) {
    charpos = 0;
    linepos++;
  }
  
  myscreen.Clear();
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.StatBarBG);
  rect.h = barpos;
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.MenuHiBG);
  if (linepos > (int)ebook.size()-1) {
    linepos = ebook.size()+myscreen.maxlines-2;
    charpos = 0;
    nextlinepos = linepos;
    nextcharpos = charpos;
    return wrapPageup(lineonly);
  }
  while (screenline < myscreen.maxlines) {
    if (linepos < (int)ebook.size()) {
      tmplines.clear();
      WrapLine(ebook[linepos].substr(charpos),tmplines);
      if (lineonly) {
        nextcharpos += tmplines[0].size()+1;
        if (nextcharpos > (int)ebook[nextlinepos].size()) {
          nextlinepos++;
          nextcharpos = 0;
        }
        tmplines.erase(tmplines.begin());
        lineonly = false;
      }
      for ( i = 0; i < tmplines.size() && screenline < myscreen.maxlines; i++) {
        if (myscreen.JustifyText == 1) {
          if (i < tmplines.size()-1) {                       
            drawLine(tmplines[i], linex, screenline++ * myscreen.mainrowheight, true);
          } else {
            drawLine(tmplines[i], linex, screenline++ * myscreen.mainrowheight, false);
          }
        } else {
          drawLine(tmplines[i], linex, screenline++ * myscreen.mainrowheight, false);
        }
        charpos = charpos + tmplines[i].size()+1;
      }
      if (i == tmplines.size()) {
        linepos++;
        charpos = 0;
      }
    } else {
      screenline++;
      linepos++;
    }
  }
  return res;
}

bool wrapPageup(bool lineonly) {
  vector<string> tmplines;
  bool res = false;
  int screenline = 0;
  unsigned int i;
  int linex = 0;
  SDL_Rect rect = {myscreen.w-2,0,2,myscreen.h};
  int barpos = linepos * (myscreen.h) / ebook.size();
  
  if (myscreen.ScrollBarPos == 0) {
    linex = 4;
    rect.x = 0;
  }
  if (charpos < 0) {
    charpos = ebook[linepos].size();
    linepos++;
  }

  myscreen.Clear();
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.StatBarBG);
  rect.h = barpos;
  myscreen.drawRect(rect.x,rect.y,rect.w,rect.h,myscreen.MenuHiBG);
  while (screenline < myscreen.maxlines) {
    if (linepos > 0 || charpos > 0) {
      tmplines.clear();
      if (linepos < (int)ebook.size()) {
        WrapLine(ebook[linepos].substr(0,charpos),tmplines);
        if (lineonly) {
          tmplines.erase(tmplines.end());
          if (tmplines.size() == 0) {
            nextlinepos--;
            nextcharpos = ebook[nextlinepos].size()+1;
          } else {
            nextcharpos = 0;
            for (unsigned int i2 = 0; i2 < tmplines.size();i2++) {
              nextcharpos += tmplines[i2].size()+1;
            }          
          }
          lineonly = false;
        }
        for ( i = 0; i < tmplines.size() && screenline < myscreen.maxlines; i++) {
          if (myscreen.JustifyText == 1) {
            if (i != 0) {                       
              drawLine(tmplines[tmplines.size() - 1 - i], linex, (myscreen.maxlines - 1 - screenline++) * myscreen.mainrowheight, true);
            } else {
              drawLine(tmplines[tmplines.size() - 1 - i], linex, (myscreen.maxlines - 1 - screenline++) * myscreen.mainrowheight, false);
            }
          } else {
            drawLine(tmplines[tmplines.size() - 1 - i], linex, (myscreen.maxlines - 1 - screenline++) * myscreen.mainrowheight, false);
          }
        }
        if (i < tmplines.size()) {
          charpos = 0;
          for (unsigned int i2 = 0; i2 < (tmplines.size() - i); i2++) {
            charpos = charpos + tmplines[i2].size()+1;
          }
        } else {
          linepos--;
          if (linepos > -1) {
            charpos = ebook[linepos].size()+1;
          } else {
            linepos = 0;
            charpos = 0;
          }
        }
      } else {
        if (lineonly) {
          screenline++;
          linepos--;
          nextlinepos--;
          if (nextlinepos < (int)ebook.size()) nextcharpos = ebook[nextlinepos].size()+1;
          lineonly = false;
        }
        linepos--;
        if (linepos < (int)ebook.size()) charpos = ebook[linepos].size()+1;
        screenline++;        
      }
    } else {
      screenline = myscreen.maxlines;
      linepos = 0;
      charpos = 0;
      nextlinepos = 0;
      nextcharpos = 0;
      res = wrapPagedown(lineonly);
    }
  }
  return res;
}

bool DrawPage(bool dir, bool lineonly) {
  bool res;
  nextlinepos = linepos;
  nextcharpos = charpos;
  if (dir) {
    res = wrapPagedown(lineonly);
  } else {
    res = wrapPageup(lineonly);
  }
  myscreen.Flip();
  return res;
}

int ShowFile(void) {
  int done = 999;
  bool redraw = true;
  bool direction = true, lastdir = true, byline = false;
  linepos = 0;
  charpos = 0;
  ParseFile();

  if (!ebook.empty()) {
    string pfn = myscreen.CurrentFile;
    pfn = pfn.erase(myscreen.CurrentFile.rfind(".")) + ".tlb";
    if (pfn.find(".zip") != string::npos) {
      pfn = pfn.substr(0,pfn.rfind("/",pfn.find(".zip"))) + pfn.substr(pfn.rfind("/"));
    }
    if (fileExists(pfn)) {
      ifstream idx(pfn.c_str());
      idx.read((char*)&linepos, sizeof(int));
      idx.read((char*)&charpos, sizeof(int));
      idx.close();
    }
    ofstream bmf(pfn.c_str(), ios::binary );

    while (done != -1) {
      if (redraw) {
        lastdir = DrawPage(direction, byline);
        bmf.seekp(0);
        if (lastdir) {
          bmf.write ((char*)&nextlinepos, sizeof (int));
          bmf.write ((char*)&nextcharpos, sizeof (int));
        } else {
          bmf.write ((char*)&linepos, sizeof (int));
          bmf.write ((char*)&charpos, sizeof (int));        
        }
        sync();
        redraw = false;
      }
      myjoystick.Check();
    
      if (myjoystick.isDn()) {
        if (!lastdir) {
          nextlinepos = linepos;
          nextcharpos = charpos;
        } else {
          linepos = nextlinepos;
          charpos = nextcharpos;
        }
        direction = true;
        byline = true;
        redraw = true;
      } else if (myjoystick.isPgdn()) {
        if (lastdir) {
          nextlinepos = linepos;
          nextcharpos = charpos;
        } else {
          linepos = nextlinepos;
          charpos = nextcharpos;
        }
        
        direction = true;
        byline = false;
        redraw = true;
      } else if (myjoystick.isUp()) {
        if (lastdir) {
          nextlinepos = linepos;
          nextcharpos = charpos;
        } else {
          linepos = nextlinepos;
          charpos = nextcharpos;
        }
        direction = false;
        byline = true;
        redraw = true;
      } else if (myjoystick.isPgup()) {
        if (!lastdir) {
          nextlinepos = linepos;
          nextcharpos = charpos;
        } else {
          linepos = nextlinepos;
          charpos = nextcharpos;
        }
        direction = false;
        byline = false;
        redraw = true;
      } else if (myjoystick.isGostart()) {
        linepos = 0;
        charpos = 0;        
        direction = false;
        byline = false;
        redraw = true;
      } else if (myjoystick.isGoend()) {
        linepos = ebook.size();
        charpos = 0;        
        direction = true;
        byline = false;
        redraw = true;
      } else if (myjoystick.isExit()) {
        myscreen.CurrentFile = "";
        break;
      } else if (myjoystick.isPlayer()) {
        player.show();
        if (lastdir) {
          linepos = nextlinepos;
          charpos = nextcharpos;
        }
        byline = false;
        redraw = true;
      } else if (myjoystick.isVolup()) {
       player.changeVolume(5);
      } else if (myjoystick.isVoldown()) {
       player.changeVolume(-5);
      } else if (myjoystick.isMenu()) {
        done = ShowMenu();
        if (done == 1) {
          myscreen.CurrentFile = "";
          break;
        }
        if (lastdir) {
          linepos = nextlinepos;
          charpos = nextcharpos;
        }
        byline = false;
        redraw = true;
      } else if (myjoystick.isHibernate()) {
#ifdef GP2X
        if (myjoystick.LcdOn) {
          myjoystick.LcdOn = disablelcd();
        } else {
          myjoystick.LcdOn = enablelcd();
        }
#endif
      }
    }
    bmf.close();
  } else {
    myscreen.CurrentFile = "";
  }
  return done; 
}

int main (int argc, char *argv[])
{
	int done = 999;

	/* Initialize SDL */
	atexit (Terminate);
    myscreen.init();

    SDL_ShowCursor(SDL_DISABLE);

    myjoystick.init();

    player.init(myscreen.AudioBase);
        
    while (done != -1) {
      if (myscreen.CurrentFile == "") {
        if (!GetFile()) {
          done = -1;
        }
      } else {
        if (!fileExists(myscreen.CurrentFile)) {
          if (!GetFile()) {
            done = -1;
          }
        }
      }                                        
      if (done != -1) {
        done = ShowFile();
      }
    }
	return 0;
}
