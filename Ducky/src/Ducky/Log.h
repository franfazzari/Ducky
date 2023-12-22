#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"


namespace Ducky
{
	class DUCKY_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

// Core log macros
#define DK_CORE_TRACE(...) ::Ducky::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define DK_CORE_INFO(...) ::Ducky::Log::GetCoreLogger()->info(__VA_ARGS__)
#define DK_CORE_WARN(...) ::Ducky::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define DK_CORE_ERROR(...) ::Ducky::Log::GetCoreLogger()->error(__VA_ARGS__)
#define DK_CORE_FATAL(...) ::Ducky::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Cliente log macros
#define DK_TRACE(...) ::Ducky::Log::GetClientLogger()->trace(__VA_ARGS__)
#define DK_INFO(...) ::Ducky::Log::GetClientLogger()->info(__VA_ARGS__)
#define DK_WARN(...) ::Ducky::Log::GetClientLogger()->warn(__VA_ARGS__)
#define DK_ERROR(...) ::Ducky::Log::GetClientLogger()->error(__VA_ARGS__)
#define DK_FATAL(...) ::Ducky::Log::GetClientLogger()->fatal(__VA_ARGS__)

// If dist build I can define those to nothing in dist build.