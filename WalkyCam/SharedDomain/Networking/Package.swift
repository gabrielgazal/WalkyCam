// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Moya/Moya.git",
            .upToNextMajor(from: "15.0.0")
        ),
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [
                .product(name: "CombineMoya", package: "Moya")
            ])
    ]
)
