// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import Foundation
import PackageDescription

var linkerSettings: [LinkerSetting] = [
	.linkedLibrary("skia_skiakit"),
    .linkedLibrary("freetype"),
    .linkedLibrary("fontconfig"),
    .linkedLibrary("z"),
]

#if os(macOS)
linkerSettings.append(.linkedLibrary("c++"))
#else
linkerSettings.append(.linkedLibrary("stdc++"))
#endif

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
				linkerSettings: linkerSettings
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

