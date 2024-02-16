#pragma once
#include "Application.h"


#ifdef DK_PLATFORM_WINDOWS

extern Ducky::Application* Ducky::CreateApplication();

int main(int argc, char** argv)
{
	Ducky::Log::Init();
	DK_CORE_WARN("Initialized Log!");
	int a = 5;
	DK_INFO("Hello! var={0}", a);

	auto app = Ducky::CreateApplication();
	app->Run();
	delete app;
}

#endif

