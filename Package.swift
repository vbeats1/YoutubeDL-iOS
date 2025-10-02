// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "YoutubeDL-iOS",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "YoutubeDL",
            type: .dynamic,
            targets: ["YoutubeDL"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/FFmpeg-iOS-Lame", from: "0.0.6-b20230730-000000"),
        .package(url: "https://github.com/pvieito/PythonKit.git", from: "0.3.1"),
        .package(url: "https://github.com/kewlbear/Python-iOS.git", from: "0.1.1-b"),
    ],
    targets: [
        .target(
            name: "YoutubeDL",
            dependencies: ["Python-iOS", "PythonKit", "FFmpeg-iOS-Lame"],
            swiftSettings: [
                .unsafeFlags(["-Xcc", "-Wno-nullability-completeness"], .when(platforms: [.iOS]))
            ]),
        .testTarget(
            name: "YoutubeDL_iOSTests",
            dependencies: ["YoutubeDL"]),
    ]
)
