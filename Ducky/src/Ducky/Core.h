#pragma once

#ifdef DK_PLATFORM_WINDOWS
	#ifdef DK_BUILD_DLL
		#define DUCKY_API __declspec(dllexport)
	#else
		#define DUCKY_API __declspec(dllimport)
	#endif
#else
	#error Ducky only supports  Windows!
#endif

#ifdef DK_DEBUG
	#define DK_ENABLE_ASSERTS
#endif

#ifdef DK_ENABLE_ASSERTS
	#define DK_ASSERT(x, ...) { if(!(x)) {DK_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define DK_CORE_ASSERT(x, ...) {if(!(x)) {DK_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define DK_ASSERT(x, ...)
	#define DK_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define DK_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)