#pragma once

#include "Core.h"
#include "Events/Event.h"
//#include "Window.h"

namespace Ducky
{
	class DUCKY_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	private:

	};
	
	// To be defined in CLIENT
	Application* CreateApplication();

}

