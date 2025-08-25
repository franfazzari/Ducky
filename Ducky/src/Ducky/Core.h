#pragma once

#ifdef DK_PLATFORM_WINDOWS
	#ifdef DK_BUILD_DLL
		#define DUCKY_API __declspec(dllexport)
	#else
		#define DUCKY_API __declspec(dllimport)
	#endif
#else
	#error Ducky only supports Windows!
#endif