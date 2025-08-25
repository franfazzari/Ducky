#pragma once

#include "Core.h"

namespace Ducky {

	class DUCKY_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	
	// To be defined in CLIENT
	Application* CreateApplication();
}


