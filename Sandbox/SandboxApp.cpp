#include <Ducky.h>

class Sandbox : public Ducky::Application
{
public:
	Sandbox()
	{

	}
	~Sandbox()
	{

	}
};

Ducky::Application* Ducky::CreateApplication()
{
	return new Sandbox();
}