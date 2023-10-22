#pragma once
#include "Application.h"

#ifdef DK_PLATFORM_WINDOWS

extern Ducky::Application* Ducky::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Ducky::CreateApplication();
	app->Run();
	delete app;
}

#endif

