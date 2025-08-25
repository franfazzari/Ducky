#pragma once

#ifdef DK_PLATFORM_WINDOWS

extern Ducky::Application* Ducky::CreateApplication();

int main(int argc, char** argv)
{
	printf("Ducky Engine\n");
	auto app = Ducky::CreateApplication();
	app->Run();
	delete app;
}

#endif