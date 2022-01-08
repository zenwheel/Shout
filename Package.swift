// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Shout",
    products: [
        .library(name: "Shout", targets: ["Shout"]),
    ],
    dependencies: [
        .package(name: "Socket", url: "https://github.com/Kitura/BlueSocket", .branch("master")),
        .package(name: "CSSH", url: "https://github.com/DimaRU/Libssh2Prebuild.git", .branch("master"))
    ],
    targets: [
        .target(name: "Shout", dependencies: ["CSSH", "Socket"]),
        .testTarget(name: "ShoutTests", dependencies: ["Shout"]),
    ]
)
#if os(watchOS)
package.targets.removeAll(where: { $0.name == "ShoutTests"})
#endif
