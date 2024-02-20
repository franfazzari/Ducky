workspace "Ducky"
	architecture "x64"
	startproject "Sandbox"
	configurations{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Ducky/vendor/GLFW/include"
IncludeDir["Glad"] = "Ducky/vendor/Glad/include"
IncludeDir["imgui"] = "Ducky/vendor/imgui"
IncludeDir["glm"] = "Ducky/vendor/glm"


include "Ducky/vendor/GLFW"
include "Ducky/vendor/Glad"
include "Ducky/vendor/imgui"

project "Ducky"
	location"Ducky"
	kind "StaticLib"
	language  "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "dkpch.h"
	pchsource "Ducky/src/dkpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.imgui}",
		"%{IncludeDir.glm}"
	}

	links
	{
		"GLFW",
		"Glad",
		"imgui",
		"opengl32.lib"
	}

	filter "system:windows"
		 systemversion "latest"

		 defines
		 {
			 	"DK_PLATFORM_WINDOWS",
				"DK_BUILD_DLL",
				"GLFW_INCLUDE_NONE"
		 }

	filter "configurations:Debug"
		defines "DK_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "DK_RELEASE"
		buildoptions "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "DK_DIST"
		buildoptions "/MD"
		optimize "on"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	staticruntime "on"
	cppdialect "C++17"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Ducky/vendor/spdlog/include",
		"Ducky/src",
		"%{IncludeDir.glm}",
		"Ducky/vendor"
	}

	links
	{
		"Ducky"
	}

	filter "system:windows"
			systemversion "latest"

			defines
			{
			 	"DK_PLATFORM_WINDOWS"
			}

	filter "configurations:Debug"
		defines "DK_DEBUG"
		buildoptions "/MDd"
		symbols "on"

	filter "configurations:Release"
		defines "DK_RELEASE"
		buildoptions "/MD"
		optimize "on"

	filter "configurations:Dist"
		defines "DK_DIST"
		buildoptions "/MD"
		optimize "on"