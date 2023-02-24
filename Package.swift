// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "OSSSpeechKit",
    platforms: [
        .iOS(.v12),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "OSSSpeechKit",
            targets: ["OSSSpeechKit"]),
        .library(
            name: "OSSSpeechKit-Static",
            type: .static,
            targets: ["OSSSpeechKit"]),
        .library(
            name: "OSSSpeechKit-Dynamic",
            type: .dynamic,
            targets: ["OSSSpeechKit"])
    ],

	// MARK: - Targets
    targets: [
        // // MARK: - OSSSpeachKit
        .target(
            name: "OSSSpeechKit",
            path: "OSSSpeechKit/",
            sources: [
                "Classes/OSSSpeech.swift",
                "Classes/OSSSpeechUtility.swift",
                "Classes/OSSUtterance.swift",
                "Classes/OSSVoice.swift"
            ],
            resources: [
                .process("Assets/")
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("AVFoundation"),
				.linkedFramework("Speech", .when(platforms: [.iOS]))
            ]
        ),
		
    .testTarget(
        name: "OSSSpeechKitTests",
        dependencies: [
            "OSSSpeechKit"
        ],
        path: "Example/Tests",
        exclude: [
            "Info.plist"
        ],
        linkerSettings: [
            .linkedFramework("AVKit")
        ]
    )],
    swiftLanguageVersions: [.v5]
)
