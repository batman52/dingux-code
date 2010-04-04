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
#include <sys/stat.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include "utils.h"

#ifdef GP2X
  #include <sys/mman.h>
  #include <fcntl.h>

  #define OFF_GPIOH    (0x0837)
  #define PWR_TFT_BIT  (2)
  #define SYS_CLK_FREQ 7372800
#endif

struct to_lower {
  int operator() ( int ch )
  {
    return std::tolower ( ch );
  }
};

string itos(int i)	{
  stringstream s;
  s << i;
  return s.str();
}

void Tokenise(const string& str, vector<string>& tokens, const string& delimiters) {
  string::size_type lastPos = 0;
  string::size_type pos     = str.find_first_of(delimiters, lastPos+1);
  string tmp;

  while (string::npos != pos) {
    tmp = str.substr(lastPos, pos - lastPos);
    if (tmp[tmp.size()-1] == '\r') {
      tmp.erase(tmp.size()-1,1);
    }
    tokens.push_back(tmp);

//    lastPos = str.find_first_not_of(delimiters, pos);
    lastPos = pos+1;
    pos = str.find_first_of(delimiters, lastPos);
  }
  tmp = str.substr(lastPos);
  if (tmp[tmp.size()-1] == '\r') {
    tmp.erase(tmp.size()-1,1);
  }
  tokens.push_back(tmp);  
}

void intTokens(const string& str, vector<int>& tokens, const string& delimiters) {
  string::size_type lastPos = str.find_first_not_of(delimiters, 0);
  string::size_type pos     = str.find_first_of(delimiters, lastPos);
  string tmp;

  while (string::npos != pos || string::npos != lastPos) {
    tmp = str.substr(lastPos, pos - lastPos);
    if (tmp[tmp.size()-1] == '\r') {
      tmp.erase(tmp.size()-1,1);
    }
    tokens.push_back(atoi(tmp.c_str()));
    lastPos = str.find_first_not_of(delimiters, pos);
    pos = str.find_first_of(delimiters, lastPos);
  }
}

void SplitLines(bool conv, const string& str, vector<string>& lines, const string& delimiters) {
  string::size_type lastPos = 0;
  string::size_type pos     = str.find_first_of(delimiters, lastPos);
  string tmp;

  while (string::npos != pos || string::npos != lastPos) {
    tmp = str.substr(lastPos, pos - lastPos);
    if (tmp[0] == '\xEF' && tmp[1] == '\xBB' && tmp[2] == '\xBF') {
      tmp.erase(0,3);
    }
    if (tmp[tmp.size()-1] == '\r') {
      tmp.erase(tmp.size()-1,1);
    }
    if (conv) {
      while (tmp.find('\221') != string::npos) {
        tmp.replace(tmp.find('\221'),1,"'");
      }
      while (tmp.find('\222') != string::npos) {
        tmp.replace(tmp.find('\222'),1,"'");
      }
      while (tmp.find('\223') != string::npos) {
        tmp.replace(tmp.find('\223'),1,"\"");
      }
      while (tmp.find('\224') != string::npos) {
        tmp.replace(tmp.find('\224'),1,"\"");
      }
      while (tmp.find('\227') != string::npos) {
        tmp.replace(tmp.find('\227'),1,"-");
      }
      while (tmp.find('\205') != string::npos) {
        tmp.replace(tmp.find('\205'),1,"...");
      }
      while (tmp.find('\037') != string::npos) {
        tmp.erase(tmp.find('\037'),1);
      }
    }
    lines.push_back(tmp);
    lastPos = str.find_first_not_of(delimiters, pos);
    pos = str.find_first_of(delimiters, lastPos);
  }
}

string trim(string& s,const string& drop) {
 string r = s.erase(s.find_last_not_of(drop)+1);
 return r.erase(0,r.find_first_not_of(drop));
}

string inttohex(int num) {
  char tmpC[35];
  sprintf(tmpC,"%X",num);
  if (strlen(tmpC) == 1) {
    tmpC[2] = tmpC[1];
    tmpC[1] = tmpC[0];
    tmpC[0] = '0';
  }
  return tmpC;
}

wstring StringToWString(const string& s) {
  wstring temp(s.length(),L' ');
  copy(s.begin(), s.end(), temp.begin());
  return temp;
}

int wLen(string str) {
  unsigned int pos = 0;
  int len = 0;
  int advance;
  unsigned int size = str.size();
//  const char* c = str.c_str();
  while (pos < size) {
    advance = 1;
    if ((unsigned)str[pos] > 192 && (unsigned)str[pos] < 224) {
      advance = 2;
    }
    if ((unsigned)str[pos] > 224 && (unsigned)str[pos] < 240) {
      advance = 3;
    }
    if ((unsigned)str[pos] > 240 && (unsigned)str[pos] < 248) {
      advance = 4;
    }
    if ((unsigned)str[pos] > 248 && (unsigned)str[pos] < 252) {
      advance = 5;
    }
    if ((unsigned)str[pos] > 252) {
      advance = 6;
    }
    pos += advance;
    len++; 
  }
  return len;
}

#ifdef GP2X
void SetClock(unsigned int MHZ) {
  int memfd = open("/dev/mem",O_RDWR);
  unsigned long *memregs32 = (unsigned long*)mmap(0, 0x10000, PROT_READ|PROT_WRITE, MAP_SHARED, memfd, 0xc0000000);
  unsigned short *memregs16 = (unsigned short*)memregs32;
  unsigned int v;
  unsigned int mdiv,pdiv=3,scale=0;
  MHZ*=1000000;
  mdiv=(MHZ*pdiv)/SYS_CLK_FREQ;
 
  mdiv=((mdiv-8)<<8) & 0xff00;
  pdiv=((pdiv-2)<<2) & 0xfc;
  scale&=3;
  v = mdiv | pdiv | scale;
 
  unsigned int l = memregs32[0x808>>2];
  memregs32[0x808>>2] = 0xFF8FFFE7;   
  memregs16[0x910>>1]=v;              
  while(memregs16[0x0902>>1] & 1);    
  memregs32[0x808>>2] = l;            
  close(memfd);
}

bool disablelcd() {
  int memfd;
  unsigned short tfton, tftoff;
  unsigned short *mmCpuRegisters;
 
  memfd = open("/dev/mem", O_RDWR);
  if (memfd != -1) {
    mmCpuRegisters = (unsigned short *)mmap(0, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, 0xc0000000);
    if (mmCpuRegisters != (unsigned short *)0xFFFFFFFF) {
 
      tfton = mmCpuRegisters[OFF_GPIOH] | (1<<PWR_TFT_BIT);
      tftoff = tfton & (~(1<<PWR_TFT_BIT));
      mmCpuRegisters[OFF_GPIOH] = tftoff;

//      screenisoff=1;
    }
  }
  return false;
}

bool enablelcd() {
  int memfd;
  unsigned short tfton, tftoff;
  unsigned short *mmCpuRegisters;
 
  memfd = open("/dev/mem", O_RDWR);
  if (memfd != -1) {
 
    mmCpuRegisters = (unsigned short *)mmap(0, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, memfd, 0xc0000000);
    if (mmCpuRegisters != (unsigned short *)0xFFFFFFFF) {
 
      tfton = mmCpuRegisters[OFF_GPIOH] | (1<<PWR_TFT_BIT);
      tftoff = tfton & (~(1<<PWR_TFT_BIT));
      mmCpuRegisters[OFF_GPIOH] = tfton;
//      screenisoff=0; 
    }
  }
  return true;
}
#endif

bool fileExists(string file) {
  if (file.find(".zip") != string::npos) {
    file = file.substr(0,file.rfind("/"));
  }
  bool fileexists;
  ifstream fl(file.c_str());
  fileexists = fl.is_open();
  fl.close();
  return fileexists;
}

string lcase(string str) {
  string tmpS = str;
  transform(str.begin(), str.end(), tmpS.begin(), to_lower());
  return tmpS;
}

string reverse(string str) {
  unsigned int pos = 0;
  int advance;
  string res = "";
  unsigned int size = str.size();
//  const char* c = str.c_str();
  while (pos < size) {
    advance = 1;
    if ((unsigned)str[pos] > 192 && (unsigned)str[pos] < 224) {
      advance = 2;
    }
    if ((unsigned)str[pos] > 224 && (unsigned)str[pos] < 240) {
      advance = 3;
    }
    if ((unsigned)str[pos] > 240 && (unsigned)str[pos] < 248) {
      advance = 4;
    }
    if ((unsigned)str[pos] > 248 && (unsigned)str[pos] < 252) {
      advance = 5;
    }
    if ((unsigned)str[pos] > 252) {
      advance = 6;
    }
    res = str.substr(pos,advance) + res;
    pos += advance;
  }
  return res;
}

string bidify(string str) {
  string word;
  int indx;
  string mystr = "";
  string engstr = "";
  indx = 0;

  //mystr = str;
  int pos;
  pos = str.find(" ",indx);
  while (pos != string::npos) {
    word = str.substr(indx,pos-indx);
    word = trim(word," ");
    fprintf(stderr,"%d,%d - %s\r\n",indx,pos,word.c_str());
    indx = pos;
    pos = str.find(" ",indx);
    if (pos != string::npos) pos++;
    if ((unsigned)word[0] > 192) {
      if (engstr.size() > 0) {
        mystr = engstr + " " + mystr;
        engstr = "";
      }
      mystr = reverse(word) + " " +mystr;
    } else {
      if (engstr.size() > 0) {
        engstr = engstr + " " + word;
      } else {
        engstr = word;
      }
    }
  }
  word = str.substr(indx);
  fprintf(stderr,"%d,%d - %s\r\n",indx,pos,word.c_str());
  if ((unsigned)word[0] > 192) {
    if (engstr.size() > 0) {
      mystr = engstr + " " + mystr;
      engstr = "";
    }
    mystr = reverse(word) + " " +mystr;
  } else {
    if (engstr.size() > 0) {
      engstr = engstr + " " + word;
    } else {
      engstr = word;
    }
  }
  
/*


  while (str.find(" ",ind) == string::npos) {
    word = str.substr(ind,str.find(" ",ind));
    ind = str.find(" ",ind);
    if ((unsigned)word[0] > 192) {
      if (engstr.size() == 0) {
        mystr = engstr + mystr;
        engstr = "";
      }
      mystr = reverse(trim(word," ")) + " " + mystr;
    } else {
      engstr = engstr + word;
    }
  }
*/
  return mystr;
}
