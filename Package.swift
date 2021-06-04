// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import Foundation
import PackageDescription

let dir = URL(fileURLWithPath: #file).deletingLastPathComponent().path

let linkFlags: [LinkerSetting] = [
	.unsafeFlags(["-L" + dir + "/native/linux"]),
]

let package = Package(
    name: "SkiaKit",
    platforms: [
	.macOS(.v10_15),
	.iOS(.v13),
	.tvOS(.v13),
    ],    
    products: [
        .library(name: "SkiaKit", targets: ["SkiaKit"]),
				.executable(name: "Samples", targets: ["Samples"])
    ],
    targets: [
			.target (
				name: "SkiaKit", 
				dependencies: ["CSkia"]
				/*cSettings: [
								.headerSearchPath("Shared/Headers"),
								.headerSearchPath("SkiaKit/Apple", .when (platforms: [.macOS,.tvOS, .iOS])),
								.headerSearchPath("SkiaKit/macOS", .when (platforms: [.macOS])),
								.headerSearchPath("SkiaKit/iOS", .when (platforms: [.iOS])),
								.headerSearchPath("SkiaKit/tvOS", .when (platforms: [.tvOS])),
						.headerSearchPath("include")],
						linkerSettings: linkFlags*/
			),
			.target (
				name: "CSkia",
				linkerSettings: [
					.linkedLibrary("skia"),
					.linkedLibrary("freetype"),
					.linkedLibrary("fontconfig"),
					.linkedLibrary("z"),
					#if os(macOS)
					.linkedLibrary("c++"),
					#else
					.linkedLibrary("stdc++"),
					#endif
				]
				/*,
				path: "skiasharp",
				sources: ["dummy.m"],
				cSettings: [
								.headerSearchPath("../Shared/Headers"),
								.headerSearchPath("../SkiaKit/macOS", .when (platforms: [.macOS])),
						.headerSearchPath("include")]*/
				),
				.target(
					name: "Samples",
					dependencies: ["CSkia", "SkiaKit"],
					path: "Samples/Gallery",
					sources: ["main.swift", "2DPathSample.swift"]
				)
    ]
)

