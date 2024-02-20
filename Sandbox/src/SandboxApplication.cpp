#include <Ducky.h>

#include "imgui/imgui.h"

class ExampleLayer : public Ducky::Layer
{
public:
	ExampleLayer()
		: Layer ("Example")
	{

	}

	void OnImGuiRender() override
	{
		ImGui::Begin("Test");
		ImGui::Text("Hello World!");
		ImGui::End();
	}

	void OnUpdate() override
	{
		DK_INFO("ExampleLayer::Update");
		if (Ducky::Input::IsKeyPressed(DK_KEY_TAB))
			DK_INFO("Tab key is pressed!");
	}

	void OnEvent(Ducky::Event& event) override
	{
		//DK_TRACE("{0}", event);
	}
};

class Sandbox : public Ducky::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Ducky::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};
	Ducky::Application* Ducky::CreateApplication()
	{
		return new Sandbox();
	}



