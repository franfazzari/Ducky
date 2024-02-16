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
	kind "SharedLib"
	language  "C++"
	staticruntime "off"

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
		 cppdialect "C++17"
		 staticruntime "Off"
		 systemversion "latest"

		 defines
		 {
			 	"DK_PLATFORM_WINDOWS",
				"DK_BUILD_DLL",
				"GLFW_INCLUDE_NONE"
		 }

		 os.chdir("C:\\Dev\\Ducky")
		 postbuildcommands
		 {
			 ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
		 }
				--("{COPY} C:\\Dev\\Ducky\\bin\\Debug-windows-x86_64\\Ducky\\Ducky.dll ../bin/" .. outputdir .. "/Sandbox"

	filter "configurations:Debug"
		defines "DK_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "DK_RELEASE"
		buildoptions "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "DK_DIST"
		buildoptions "/MD"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	staticruntime "off"

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
		"%{IncludeDir.glm}"
	}

	links
	{
		"Ducky"
	}

	filter "system:windows"
			cppdialect "C++17"
			systemversion "latest"

			defines
			{
			 	"DK_PLATFORM_WINDOWS"
			}

	filter "configurations:Debug"
		defines "DK_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "DK_RELEASE"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		defines "DK_DIST"
		buildoptions "/MD"
		optimize "On"