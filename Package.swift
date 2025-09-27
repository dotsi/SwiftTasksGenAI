// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftTasksGenAI",
    platforms: [
        .iOS(.v13),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTasksGenAI",
            targets: ["SwiftTasksGenAI"]
        ),
        .executable(
            name: "UpdatePackage",
            targets: ["UpdatePackage"]
        )
    ],
    targets: [
        .target(
            name: "SwiftTasksGenAI",
            dependencies: ["SwiftTasksGenAICore"]
        ),
        .target(
            name: "SwiftTasksGenAICore",
            dependencies: [
                "MediaPipeGenAICLibraries",
                "MediaPipeTasksGenAIC",
                "MediaPipeTasksGenAI"
            ],
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAI",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeTasksGenAI.xcframework.zip",
            checksum: "4a79aacb7864baf142448353a5131f48767bf861670cb25c70f682f97171e066"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeGenAICLibraries.xcframework.zip",
            checksum: "681771c1c7234a910d03dabeb33fc7cdc3314731af2ef81f828bfc47b2a6cf46"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/paescebu/SwiftTasksGenAI/releases/download/0.10.24/MediaPipeTasksGenAIC.xcframework.zip",
            checksum: "298c27c204c14cd3a8b737493f11515b9229590aac676f844fba26063b2f3b38"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
