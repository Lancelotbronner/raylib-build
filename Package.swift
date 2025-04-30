// swift-tools-version:6.1

import PackageDescription

//MARK: - Package

let package = Package(
	name: "raylib",
	products: [
		.library(name: "raylib", targets: ["raylib"]),
	],
	targets: [
		.target(
			name: "raylib",
			path: ".",
			cSettings: [
				// Configure macOS
				.define("_GLFW_COCOA", .when(platforms: [.macOS])),
				.define("_GLFW_USE_MENUBAR", .when(platforms: [.macOS])),
				.define("_GLFW_USE_RETINA", .when(platforms: [.macOS])),
			]),
	]
)
