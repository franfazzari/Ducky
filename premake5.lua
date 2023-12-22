workspace "Ducky"
	architecture "x64"

	configurations{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Ducky/vendor/GLFW/include"

include "Ducky/vendor/GLFW"

project "Ducky"
	location"Ducky"
	kind "SharedLib"
	language  "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "dkpch.h"
	pchsource "Ducky/src/dkpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		 cppdialect "C++17"
		 staticruntime "Off"
		 systemversion "latest"

		 defines
		 {
			 	"DK_PLATFORM_WINDOWS",
				"DK_BUILD_DLL"
		 }

		 os.chdir("C:\\Dev\\Ducky")
		 postbuildcommands
		 {
			 ("{COPY} C:\\Dev\\Ducky\\bin\\Debug-windows-x86_64\\Ducky\\Ducky.dll ../bin/" .. outputdir .. "/Sandbox"
)
		 }

	filter "configurations:Debug"
		defines "DK_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "DK_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "DK_DIST"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"

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
		"Ducky/src"
	}

	links
	{
		"Ducky"
	}

	filter "system:windows"
			cppdialect "C++17"
			staticruntime "On"
			systemversion "latest"

			defines
			{
			 	"DK_PLATFORM_WINDOWS"
			}

	filter "configurations:Debug"
		defines "DK_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "DK_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "DK_DIST"
		optimize "On"