// swift-tools-version:6.1

import PackageDescription

//MARK: - Package

let package = Package(
	name: "raylib",
	products: [
		.library(name: "raylib", targets: ["raylib"]),
	],
	traits: [
		.default(enabledTraits: ["GLFW", "X11"]),
		"GLFW",
		"RGFW",
		"X11",
		"SDL",
		"Wayland",
		"DRM",
	],
	targets: [
		.target(
			name: "raylib",
			dependencies: [
				.target(name: "X11", condition: .when(platforms: [.linux, .openbsd], traits: ["X11"])),
				.target(name: "Wayland", condition: .when(platforms: [.linux, .openbsd], traits: ["Wayland"])),
			],
			sources: [
				"raudio.c",
				"rcore.c",
				"rglfw.m",
				"rmodels.c",
				"rshapes.c",
				"rtext.c",
				"rtextures.c",
			],
			cSettings: [
				// Configure raylib
				.headerSearchPath("."),
				.headerSearchPath("external/glfw/include"),
				.define("PLATFORM_DESKTOP_GLFW", .when(platforms: [.macOS, .windows, .linux, .openbsd], traits: ["GLFW"])),
				.define("PLATFORM_DESKTOP_RGFW", .when(platforms: [.macOS, .windows, .linux, .openbsd], traits: ["RGFW"])),
				.define("PLATFORM_DESKTOP_SDL", .when(platforms: [.macOS, .windows, .linux, .openbsd], traits: ["SDL"])),
				.define("PLATFORM_DESKTOP_DRM", .when(traits: ["DRM"])),
				.define("PLATFORM_ANDROID", .when(platforms: [.android])),
				.define("PLATFORM_WEB", .when(platforms: [.wasi])),
				// Configure Linux
				.define("_GLFW_X11", .when(platforms: [.linux, .openbsd], traits: ["X11"])),
				.define("_GLFW_WAYLAND", .when(platforms: [.linux, .openbsd], traits: ["Wayland"])),
			]),
		
		//TODO: Find a good swift-x11 library and use that instead
		.systemLibrary(name: "X11"),

		//TODO: Find a good swift-wayland library and use that instead
		.systemLibrary(name: "Wayland"),
	]
)
