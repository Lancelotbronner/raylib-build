// swift-tools-version:6.1

import PackageDescription

//MARK: - Package

let package = Package(
	name: "raylib",
	products: [
		.library(name: "raylib", targets: ["raylib"]),
	],
	traits: [
		.default(enabledTraits: ["X11"]),
		"X11",
		"Wayland",
	],
	targets: [
		.target(
			name: "raylib",
			path: ".",
			sources: [
				"rglfw.c",
				"rcore.c",
				"rshapes.c",
				"rtextures.c",
				"rtext.c",
				"rmodels.c",
				"raudio.c",
				"utils.c",
			],
			cSettings: [
				// Configure raylib
				.headerSearchPath("."),
				.headerSearchPath("./wayland", .when(traits: ["Wayland"])),

				.define("PLATFORM_DESKTOP_GLFW", .when(platforms: [.macOS, .windows, .linux, .openbsd])),
				.define("PLATFORM_ANDROID", .when(platforms: [.android])),
				.define("PLATFORM_WEB", .when(platforms: [.wasi])),

				// Configure Linux
				.define("_GLFW_WAYLAND", .when(platforms: [.linux], traits: ["Wayland"])),
				.define("_GLFW_X11", .when(platforms: [.linux], traits: ["X11"])),

				// Configure macOS
				.define("_GLFW_COCOA", .when(platforms: [.macOS])),
				.define("_GLFW_USE_MENUBAR", .when(platforms: [.macOS])),
				.define("_GLFW_USE_RETINA", .when(platforms: [.macOS])),
			]),
	]
)
