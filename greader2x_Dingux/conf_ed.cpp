#include <iostream>
#include <fstream>
#include "conf_ed.h"
#include "GetDir.h"
#include "utils.h"

using namespace std;

Tconfigeditor::Tconfigeditor(TScrn *sc) {
  scrn = sc;
}

void Tconfigeditor::readIni(void) {
  string line;
  cfgfile.clear();
  ifstream infil("greader2x.cfg");
  while (!infil.eof()) {
    getline(infil,line);
    cfgfile.push_back(line);
  }
  infil.clear();
  infil.close();
  extractOptions();
}

void Tconfigeditor::writeIni(void) {
  int srcI = 0;
  
  string tmpS;
  scrn->waitMessage();
  for (vector<string>::iterator i = cfgfile.begin(); i != cfgfile.end(); ++i) {
    tmpS = *(i);
    if (tmpS.substr(0,options[srcI].size()) == options[srcI]) {
      *(i) = options[srcI] + "=" + values[srcI];
      if (++srcI > (int)options.size()-1) srcI = options.size()-1;
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

void Tconfigeditor::showIni(void) {
  int ht = scrn->menurowheight;
  int topitem = 0;
  int curitem = 0;
  int maxitems = (scrn->h / ht)-3;
  string n = scrn->lang[4];
  int done = 999;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+6,scrn->w-6,scrn->h-(2*scrn->menurowheight)+6,4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+7,scrn->w-8,scrn->h-(2*scrn->menurowheight)+4,4,scrn->MainBG);
      for (unsigned int i = 0; i <= (unsigned)maxitems; i++) {
        if (topitem + i < options.size()) {
          if ((topitem+(int)i) == curitem) {
            scrn->drawRect(3,(ht+10) + i * ht,scrn->w-7,ht,scrn->MenuHiBG);
          }
          scrn->drawText(4,(ht+10) + i * ht, options[topitem+i], scrn->menufont);
          scrn->drawText(scrn->w-scrn->sizeText(values[topitem+i],scrn->menufont)-6,(ht+10) + i * ht, values[topitem+i], scrn->menufont);
        }
      }
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      if (--curitem < 0) {
        curitem = 0;
      }
      if (curitem < topitem) {
        topitem = curitem;
      }
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      if (++curitem >= (int)options.size()) {
        curitem = options.size()-1;
      }
      if (curitem > topitem+maxitems) {
        if (topitem < curitem) topitem++;
      }
      redraw = true;
    }
    if (scrn->joy->isPgup()) {
      if (curitem -= maxitems < 0) {
        curitem = 0;
      }
      if (curitem < topitem) {
        topitem = curitem;
      }
      redraw = true;
    }
	if (scrn->joy->isPgdn()) {
      curitem += maxitems;
      if (curitem >= (int)options.size()) {
        curitem = options.size()-1;
      }
      if (curitem > topitem+maxitems-1) {
        topitem = curitem;
      }
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      editOption(options[curitem],values[curitem]);
      redraw = true;
    }
    if (scrn->joy->isMenu()) {
      redraw = true;
    }
  }
}

void Tconfigeditor::extractOptions(void) {
  string tmpS;
  vector<string>::iterator i (cfgfile.begin());
  vector<string>::iterator const end (cfgfile.end());
  options.clear();
  values.clear();

  for (; i != end; i++) {
    tmpS = *(i);
    if (tmpS[tmpS.size()-1] == '\r') {
      tmpS.erase(tmpS.size()-1,1);
    }
    if (tmpS[0] != '#' && tmpS.substr(0,11) != "CurrentFile") {
      if (tmpS.find("=") != string::npos) {
        options.push_back(tmpS.substr(0,tmpS.find("=")));
        tmpS = tmpS.substr(tmpS.find("=")+1);
        tmpS = trim(tmpS," ");
        values.push_back(tmpS);
      }
    }
  }
}

void Tconfigeditor::editOption(string &name, string &val) {
  if (name == "MainFont" || name == "MenuFont") {
    editFile(".ttf",val);
  } else  if (name == "Background") {
    editFile(".jpg,.png",val);
  } else if (name == "Language") {
    editFile(".lng",val);
  } else if (name == "DocBase" || name == "AudioBase") {
    editDir(val);
  } else if (name.find("FG") != string::npos || name.find("BG") != string::npos) {
    editColour(name, val);
  } else if (name.substr(0,4) == "Line" || name.substr(0,4) == "Page" || name == "Left" || \
             name == "Right" || name == "Menu" || name == "Select" || name == "Exit" || \
             name == "Player" || name == "VolUp" || name == "VolDown" || name == "GoStart" || \
             name == "GoEnd" || name == "Hibernate") {
    editKey(name, val);
  } else if (name.substr(4,8) == "FontSize") {
    editSize(name,val);
  } else if (name == "Rotate") {
    editRotate(name, val);
  } else if (name == "Speed" || name == "minSpeed") {
    editSpeed(name, val);
  } else if (name == "KeyDelay" || name == "KeyRepeat") {
    editTimings(name, val);
  } else if (name == "LCDShutOff") {
    editLCDShutOff(name, val);
  } else if (val == "0" || val == "1") {
    editBool(name, val);
  }
}

void Tconfigeditor::editFile(string ext, string& v) {
  string tmpS = ".";
  vector<string> exts;
  Tokenise(ext,exts,",");
  GetDir dir(scrn);
  for (unsigned int i = 0; i<exts.size(); i++) {
    dir.AddExt(exts[i]);
  }
  if (ext.find(".jpg") != string::npos || ext.find(".lng") != string::npos) {
    dir.addNone = true;
  }
  dir.Scan(tmpS,false);
  if (dir.Show(tmpS, true) == 1) {
    if (tmpS.find("<None>") != string::npos) tmpS = "";
    v = "\"" + tmpS + "\"";
  }
}

void Tconfigeditor::editDir(string& v) {
#ifdef GP2X
  string tmpS = "/mnt/sd";
#else
  string tmpS = "/";
#endif
  GetDir dir(scrn);
  dir.scanDirs(tmpS);
  if (dir.showDirs(tmpS) == 1) {
    tmpS.erase(tmpS.rfind("/"));
    v = "\"" + tmpS + "\"";
  }
}

void Tconfigeditor::editColour(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string col, tmpS, inst;
  int cols[3], tmpI;
  while (v.find("\"") != string::npos) {
    v.erase(v.find("\""),1);
  }
  col = "0x" + v.substr(0,2);
  cols[0] = strtol(col.c_str(),NULL,0);
  col = "0x" + v.substr(2,2);
  cols[1] = strtol(col.c_str(),NULL,0);
  col = "0x" + v.substr(4,2);
  cols[2] = strtol(col.c_str(),NULL,0);
  int curcol = 0;
  int done = 999;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(5*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(5*scrn->menurowheight)-2,4,scrn->MainBG);

      inst = keynames[scrn->joy->left[0][0]+1]+"/"+keynames[scrn->joy->right[0][0]+1]+" = "+scrn->lang[5];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(3*scrn->menurowheight),inst,scrn->menufont);
      
      inst = keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[6];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);

      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      for (int i = 0; i < 3; i++) {
        tmpS = itos(cols[i]);
        tmpI = scrn->sizeText(tmpS,scrn->menufont);
        if (i == curcol) {
          scrn->drawRoundrect(((i + 1) * (scrn->w / 4))-((tmpI/2)+5), (scrn->h / 3)-(scrn->menurowheight / 2), 2*tmpI+10, 2 * scrn->menurowheight, 4, scrn->MenuHiBG);
        }
        scrn->drawText(((i + 1) * (scrn->w / 4)), scrn->h / 3, itos(cols[i]),scrn->menufont);
      }
      tmpS = inttohex(cols[0]);
      tmpS += inttohex(cols[1]);
      tmpS += inttohex(cols[2]);
      scrn->drawText((scrn->w / 2) - (scrn->sizeText(tmpS,scrn->menufont)/2), (scrn->h / 2), tmpS,scrn->menufont);
      scrn->drawRoundrect((scrn->w / 2) - 20, (scrn->h / 2)+31, 40,20,2,cols);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      if (--cols[curcol] < 0) {
        cols[curcol] = 0;
      }
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      if (++cols[curcol] > 255) {
        cols[curcol] = 255;
      }
      redraw = true;
    }
    if (scrn->joy->isPgup()) {
      if ((cols[curcol] -= 10) < 0) {
        cols[curcol] = 0;
      }
      redraw = true;
    }
	if (scrn->joy->isPgdn()) {
      if ((cols[curcol] += 10) > 255) {
        cols[curcol] = 255;
      }
      redraw = true;
    }
    if (scrn->joy->isLeft()) {
      if (--curcol < 0) {
        curcol = 0;
      }
      redraw = true;
    }
	if (scrn->joy->isRight()) {
      if (++curcol > 2) {
        curcol = 2;
      }
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      v = "\"" + v + "\"";
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = "\"" + tmpS + "\"";
      done = -1;
    }
  }
}

void Tconfigeditor::editKey(string &n, string &v) {
  string col, tmpS, inst;
  vector<int> keys;
  vector<string> tmpkeys;
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  int tmpI, i2;
  int curkey = 0;
  while (v.find("\"") != string::npos) {
    v.erase(v.find("\""),1);
  }
  Tokenise(v,tmpkeys,",");
  for (unsigned int i = 0; i < tmpkeys.size(); i++) {
    if (tmpkeys[i].find("+") != string::npos) {
      keys.push_back(atoi(tmpkeys[i].substr(0,tmpkeys[i].find("+")).c_str()));
      keys.push_back(atoi(tmpkeys[i].substr(tmpkeys[i].find("+")+1).c_str()));
    } else {
      keys.push_back(atoi(tmpkeys[i].c_str()));
      keys.push_back(-1);
    }
  }
  while (keys.size() < 6) {
    keys.push_back(-1);
  }
  curkey = 0;
  int done = 999;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(5*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(5*scrn->menurowheight)-2,4,scrn->MainBG);

      for (int i = 0; i < 3; i++) {
        tmpS = "+";
        tmpI = scrn->sizeText(tmpS,scrn->menufont);
        scrn->drawText(((i + 1) * (scrn->w / 4))-(tmpI/2), 2 * scrn->h / 6+2, tmpS,scrn->menufont);
      }

      inst = keynames[scrn->joy->left[0][0]+1]+"/"+keynames[scrn->joy->right[0][0]+1]+"/"+keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[21];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(3*scrn->menurowheight),inst,scrn->menufont);

      inst = keynames[scrn->joy->page_up[0][0]+1]+"/"+keynames[scrn->joy->page_down[0][0]+1]+" = "+scrn->lang[7];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);

      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      i2 = 1;
      for (int i = 0; i < 6; i += 2) {
        tmpS = keynames[keys[i]+1];
        tmpI = scrn->sizeText(tmpS,scrn->menufont);
        if (i == curkey) {
          scrn->drawRoundrect((i2 * (scrn->w / 4))-((tmpI/2)+5), (scrn->h / 4)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
        }
        scrn->drawText((i2 * (scrn->w / 4))-(tmpI/2), scrn->h / 4, keynames[keys[i]+1],scrn->menufont);
        i2++;
      }
      i2 = 1;
      for (int i = 1; i < 6; i += 2) {
        tmpS = keynames[keys[i]+1];
        tmpI = scrn->sizeText(tmpS,scrn->menufont);
        if (i == curkey) {
          scrn->drawRoundrect((i2 * (scrn->w / 4))-((tmpI/2)+5), (scrn->h / 3)+(scrn->menurowheight), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
        }
        scrn->drawText((i2 * (scrn->w / 4))-(tmpI/2), (scrn->h / 3) + (scrn->menurowheight + scrn->menurowheight / 2), keynames[keys[i]+1],scrn->menufont);
        i2++;
      }


      tmpS = "";
      if (keys[0] != -1) {
        tmpS = itos(keys[0]);
        if (keys[1] != -1) {
          tmpS = tmpS + "+" + itos(keys[1]);
        }
        if (keys[2] != -1) {
          tmpS = tmpS + "," + itos(keys[2]);
          if (keys[3] != -1) {
            tmpS = tmpS + "+" + itos(keys[3]);
          }
          if (keys[4] != -1) {
            tmpS = tmpS + "," + itos(keys[4]);
            if (keys[5] != -1) {
              tmpS = tmpS + "+" + itos(keys[5]);
            }
          }
        }
      }
      scrn->drawText((scrn->w / 2) - (scrn->sizeText(tmpS,scrn->menufont)/2), 2*(scrn->h / 3), tmpS,scrn->menufont);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isPgup()) {
      if (--keys[curkey] < -1) keys[curkey] = 18;
      redraw = true;
    }
	if (scrn->joy->isPgdn()) {
      if (++keys[curkey] > 18) keys[curkey] = -1;
      redraw = true;
    }
    if (scrn->joy->isLeft()) {
      if ((curkey -= 2) < 0) curkey += 6;
      redraw = true;
    }
	if (scrn->joy->isRight()) {
      if ((curkey += 2) > 5) curkey -= 6;
      redraw = true;
    }
    if (scrn->joy->isUp()) {
      if (curkey == 1 || curkey == 3 || curkey == 5) {
        curkey--;
      } else {
        curkey++;
      }
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      if (curkey == 0 || curkey == 2 || curkey == 4) {
        curkey++;
      } else {
        curkey--;
      }
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      v = "\"" + v + "\"";
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = "\"" + tmpS + "\"";
      done = -1;
    }
  }
}

void Tconfigeditor::editBool(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string col, tmpS, inst;
  int tmpI;
  int curopt = 0;
  int done = 999;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(4*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(4*scrn->menurowheight)-2,4,scrn->MainBG);

      inst = keynames[scrn->joy->left[0][0]+1]+"/"+keynames[scrn->joy->right[0][0]+1]+" = "+scrn->lang[11];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);
      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      for (int i = 0; i < 2; i++) {
        if (n == "ScrollBarPos") {
          if (i == 0) { tmpS = scrn->lang[22]; } else { tmpS = scrn->lang[23]; }        
        } else {
          if (i == 0) { tmpS = scrn->lang[14]; } else { tmpS = scrn->lang[15]; }
        }
        tmpI = scrn->sizeText(tmpS,scrn->menufont);
        if (i == curopt) {
          scrn->drawRoundrect(((i + 1) * (scrn->w / 3))-(tmpI/2) - 5, (scrn->h / 2)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
        }
        scrn->drawText(((i + 1) * (scrn->w / 3)) - (tmpI/2), scrn->h / 2, tmpS,scrn->menufont);
      }
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isLeft()) {
      if (--curopt < 0) curopt = 0;
      redraw = true;
    }
	if (scrn->joy->isRight()) {
      if (++curopt > 1) curopt = 1;
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = itos(curopt);
      done = -1;
    }
  }
}

void Tconfigeditor::editSize(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string tmpS, inst;
  int size;
  size = strtol(v.c_str(),NULL,0);
  int done = 999;
  int tmpI;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(4*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(4*scrn->menurowheight)-2,4,scrn->MainBG);

      inst = keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[8];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);
      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      tmpS = itos(size);
      tmpI = scrn->sizeText(tmpS,scrn->menufont);
      scrn->drawRoundrect((scrn->w / 2)-((tmpI/2)+5), (scrn->h / 2)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
      scrn->drawText((scrn->w / 2)-(tmpI/2), scrn->h / 2, tmpS,scrn->menufont);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      if (--size < 5) size = 5;
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      if (++size > 38) size = 38;
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = tmpS;
      done = -1;
    }
  }
}

void Tconfigeditor::editRotate(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string tmpS, inst;
  int rot = strtol(v.c_str(),NULL,0);
  int done = 999;
  int tmpI;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(4*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(4*scrn->menurowheight)-2,4,scrn->MainBG);
      inst = keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[9];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);
      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      tmpS = itos(rot);
      tmpI = scrn->sizeText(tmpS,scrn->menufont);
      scrn->drawRoundrect((scrn->w / 2)-((tmpI/2)+5), (scrn->h / 2)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
      scrn->drawText((scrn->w / 2)-(tmpI/2), scrn->h / 2, tmpS,scrn->menufont);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      rot -= 90;
      if (rot < 0) rot = 270; 
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      rot += 90;
      if (rot > 270) rot = 0;
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = tmpS;
      done = -1;
    }
  }
}

void Tconfigeditor::editSpeed(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string tmpS, inst;
  int speed;
  speed = strtol(v.c_str(),NULL,0);
  int done = 999;
  int tmpI;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(4*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(4*scrn->menurowheight)-2,4,scrn->MainBG);
      inst = keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[10];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);
      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      tmpS = itos(speed);
      tmpI = scrn->sizeText(tmpS,scrn->menufont);
      scrn->drawRoundrect((scrn->w / 2)-((tmpI/2)+5), (scrn->h / 2)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
      scrn->drawText((scrn->w / 2)-(tmpI/2), scrn->h / 2, tmpS,scrn->menufont);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      if (--speed < 100) speed = 0;
      redraw = true;
    }
    if (scrn->joy->isPgup()) {
      speed -= 10;
      if (speed < 100) speed = 0;
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      if (++speed < 100) speed = 100;
      if (speed > 250) speed = 250;
      redraw = true;
    }
	if (scrn->joy->isPgdn()) {
      speed += 10;
      if (speed < 100) speed = 100;
      if (speed > 250) speed = 250;
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = tmpS;
      done = -1;
    }
  }
}

void Tconfigeditor::editTimings(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string tmpS, inst;
  int timing;
  timing = strtol(v.c_str(),NULL,0);
  int done = 999;
  int tmpI;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(4*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(4*scrn->menurowheight)-2,4,scrn->MainBG);
      inst = keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[10];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);
      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      tmpS = itos(timing);
      tmpI = scrn->sizeText(tmpS,scrn->menufont);
      scrn->drawRoundrect((scrn->w / 2)-((tmpI/2)+5), (scrn->h / 2)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
      scrn->drawText((scrn->w / 2)-(tmpI/2), scrn->h / 2, tmpS,scrn->menufont);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      timing -= 50;
      if (timing < 0) timing = 0;
      redraw = true;
    }
    if (scrn->joy->isPgup()) {
      timing -= 100;
      if (timing < 0) timing = 0;
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      timing += 50;
      if (timing > 2000) timing = 2000;
      redraw = true;
    }
	if (scrn->joy->isPgdn()) {
      timing += 100;
      if (timing > 2000) timing = 2000;
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = tmpS;
      done = -1;
    }
  }
}

void Tconfigeditor::editLCDShutOff(string &n, string &v) {
  string keynames[20] = {"None","J-Up","J-UpLft","J-Left","J-DnLft","J-Down", \
                         "J-DnRght","J-Right","J-UpRght","Start","Select","Left", \
                         "Right","A-Key","B-Key","Y-Key","X-Key","Vol-Up","Vol-Dn","J-Click"};
  string tmpS, inst;
  int shutoff;
  shutoff = strtol(v.c_str(),NULL,0);
  int done = 999;
  int tmpI;
  bool redraw = true;
  while (done != -1) {
    if (redraw) {
      scrn->Clear();
      scrn->drawRoundrect(2,2,scrn->w-6,scrn->menurowheight,3,scrn->StatBarBG);
      scrn->drawCliptext((scrn->w -scrn->sizeText(n,scrn->menufont)) / 2,2,scrn->w-6,scrn->menurowheight, n, scrn->menufont);
      scrn->drawRoundrect(2,scrn->menurowheight+8,scrn->w-6,scrn->h-(4*scrn->menurowheight),4,scrn->MainFG);
      scrn->drawRoundrect(3,scrn->menurowheight+9,scrn->w-8,scrn->h-(4*scrn->menurowheight)-2,4,scrn->MainBG);
      inst = keynames[scrn->joy->line_up[0][0]+1]+"/"+keynames[scrn->joy->line_down[0][0]+1]+" = "+scrn->lang[10];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(2*scrn->menurowheight),inst,scrn->menufont);
      inst = keynames[scrn->joy->select[0][0]+1]+" = "+scrn->lang[12]+", "+keynames[scrn->joy->exit[0][0]+1]+" = "+scrn->lang[13];
      scrn->drawText((scrn->w/2)-scrn->sizeText(inst,scrn->menufont)/2,scrn->h-(1*scrn->menurowheight),inst,scrn->menufont);
      tmpS = itos(shutoff);
      tmpI = scrn->sizeText(tmpS,scrn->menufont);
      scrn->drawRoundrect((scrn->w / 2)-((tmpI/2)+5), (scrn->h / 2)-(scrn->menurowheight / 2), tmpI+10, 2 * scrn->menurowheight,4, scrn->MenuHiBG);
      scrn->drawText((scrn->w / 2)-(tmpI/2), scrn->h / 2, tmpS,scrn->menufont);
      scrn->Flip();
      redraw = false;
    }
    scrn->joy->Check();
    
    if (scrn->joy->isUp()) {
      shutoff -= 30;
      if (shutoff < 30) shutoff = 30;
      redraw = true;
    }
    if (scrn->joy->isPgup()) {
      shutoff -= 60;
      if (shutoff < 30) shutoff = 30;
      redraw = true;
    }
	if (scrn->joy->isDn()) {
      shutoff += 30;
      if (shutoff > 600) shutoff = 600;
      redraw = true;
    }
	if (scrn->joy->isPgdn()) {
      shutoff += 60;
      if (shutoff > 600) shutoff = 600;
      redraw = true;
    }
    if (scrn->joy->isExit()) {
      done=-1;
    }
    if (scrn->joy->isSelect()) {
      v = tmpS;
      done = -1;
    }
  }
}
