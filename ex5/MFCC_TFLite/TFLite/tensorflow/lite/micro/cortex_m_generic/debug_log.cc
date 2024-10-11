#include <stdio.h>

extern "C" void DebugLog(const char* s) {
	printf("\%s", s);
}
