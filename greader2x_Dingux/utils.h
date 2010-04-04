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
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <climits>
#include <cstring>
#include <memory>
#include <algorithm>
#include <functional>

using namespace std;

string itos(int i);
typedef basic_string<wchar_t> wstring;
void Tokenise(const string& str, vector<string>& tokens, const string& delimiters);

void intTokens(const string& str, vector<int>& tokens, const string& delimiters);

void SplitLines(bool conv, const string& str, vector<string>& lines, const string& delimiters);

string trim(string& s,const string& drop);

string inttohex(int num);

wstring StringToWString(const string& s);

int wLen(string str);

#ifdef GP2X
void SetClock(unsigned int MHZ);
bool disablelcd();
bool enablelcd();
#endif

bool fileExists(string file);

string lcase(string str);

string reverse(string str);

string bidify(string str);
