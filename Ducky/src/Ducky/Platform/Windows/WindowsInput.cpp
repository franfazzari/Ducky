#include "dkpch.h"
#include "WindowsInput.h"

#include <GLFW/glfw3.h>

#include "Ducky/Application.h"

namespace Ducky
{
	Input* Input::s_Instance = new WindowsInput;


	bool WindowsInput::IsKeyPressedImpl(int keycode)
	{
		// Here we are getting the native window and casting it to a GLFW window.
		auto window = static_cast<GLFWwindow*>(Application::Get().GetWindow().GetNativeWindow());

		// Getting if the key is pressed down
		int state = glfwGetKey(window, keycode);
		return state == GLFW_PRESS || state == GLFW_REPEAT;
	}

	bool WindowsInput::IsMouseButtonPressedImpl(int button)
	{
		auto window = static_cast<GLFWwindow*>(Application::Get().GetWindow().GetNativeWindow());
		int state = glfwGetMouseButton(window, button);

		return state == GLFW_PRESS;
	}

	std::pair<float, float> WindowsInput::GetMousePositionImpl()
	{
		auto window = static_cast<GLFWwindow*>(Application::Get().GetWindow().GetNativeWindow());
		double xpos, ypos;
		glfwGetCursorPos(window, &xpos, &ypos);

		return { (float)xpos, (float)ypos };
	}

	float WindowsInput::GetMouseXImpl()
	{
		auto [x, y] = GetMousePositionImpl();
		return x;

	}

	float WindowsInput::GetMouseYImpl()
	{
		auto [x, y] = GetMousePositionImpl();
		return y;
	}



}
