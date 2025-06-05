// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "StremioTV",
    platforms: [ .tvOS(.v15) ],
    products: [
        .executable(name: "StremioTVApp", targets: ["StremioTVApp"])
    ],
    dependencies: [
        .package(url: "https://github.com/Stremio/stremio-core-swift", from: "1.2.62")
    ],
    targets: [
        .executableTarget(
            name: "StremioTVApp",
            dependencies: [
                .product(name: "StremioCore", package: "stremio-core-swift")
            ],
            path: "Sources/StremioTVApp"
        )
    ]
)
