#pragma once
#include "Ducky/Layer.h"
#include "Ducky/Events/ApplicationEvent.h"
#include "Ducky/Events/KeyEvent.h"
#include "Ducky/Events/MouseEvent.h"

namespace Ducky
{
	class DUCKY_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:
		float m_Time = 0.0f;
	};
}

