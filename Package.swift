// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import Foundation
import PackageDescription

let sharedSources = [
	"./Shared/SkiaKit/PictureRecorder.swift",
	"./Shared/SkiaKit/SKString.swift",
	"./Shared/SkiaKit/Picture.swift",
	"./Shared/SkiaKit/FontManager.swift",
	"./Shared/SkiaKit/MathTypes.swift",
	"./Shared/SkiaKit/Surface.swift",
	"./Shared/SkiaKit/FontStyle.swift",
	"./Shared/SkiaKit/Font.swift",
	"./Shared/SkiaKit/SurfaceProperties.swift",
	"./Shared/SkiaKit/Pixmap.swift",
	"./Shared/SkiaKit/Data.swift",
	"./Shared/SkiaKit/PathEffect.swift",
	"./Shared/SkiaKit/Definitions.swift",
	"./Shared/SkiaKit/ColorFilter.swift",
	"./Shared/SkiaKit/Paint.swift",
	"./Shared/SkiaKit/ColorSpace.swift",
	"./Shared/SkiaKit/Typeface.swift",
	"./Shared/SkiaKit/MaskFilter.swift",
	"./Shared/SkiaKit/FontStyleSet.swift",
	"./Shared/SkiaKit/SKObject.swift",
	"./Shared/SkiaKit/Image.swift",
	"./Shared/SkiaKit/RoundRect.swift",
	"./Shared/SkiaKit/ImageInfo.swift",
	"./Shared/SkiaKit/Path.swift",
	"./Shared/SkiaKit/SKStream.swift",
	"./Shared/SkiaKit/Canvas.swift",
	"./Shared/SkiaKit/Region.swift",
	"./Shared/SkiaKit/Matrix.swift",
	"./Shared/SkiaKit/Shader.swift",
	"./Shared/SkiaKit/TextBlob.swift",
	"./Shared/SkiaKit/Colors.swift",
	"./Shared/SkiaKit/ImageFilter.swift",
	"./Shared/SkiaKit/Bitmap.swift",
	"./Shared/SkiaKit/Color.swift"
]

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
					.linkedLibrary("stdc++"),
					.linkedLibrary("GL")
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

