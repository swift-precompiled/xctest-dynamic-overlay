// swift-tools-version:6.0.0

import PackageDescription
import Foundation

let package = Package(
    name: "xctest-dynamic-overlay",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15"),
        .tvOS("13.0"),
        .watchOS("6.0")
    ],
    products: [
        .library(
            name: "IssueReporting",
            targets: ["IssueReporting_Aggregation"]
        ),
        .library(
            name: "IssueReportingTestSupport",
            targets: ["IssueReportingTestSupport_Aggregation"]
        ),
        .library(
            name: "XCTestDynamicOverlay",
            targets: ["XCTestDynamicOverlay_Aggregation"]
        )
    ],
    targets: [
        .target(
            name: "IssueReporting_Aggregation",
            dependencies: ["IssueReporting"]
        ),
        .binaryTarget(
            name: "IssueReporting",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0-precompiled.2/IssueReporting-a39eaf8c6ad55b6ed2065a03b27da481f1ccc12f14743b35e92533fe734ab548.xcframework.zip",
            checksum: "a39eaf8c6ad55b6ed2065a03b27da481f1ccc12f14743b35e92533fe734ab548"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0-precompiled.2/IssueReportingTestSupport-f5cf44808bebf22e6fee05a2cfe7ae75f4e5ba8e73c0c7303a86038682bce11f.xcframework.zip",
            checksum: "f5cf44808bebf22e6fee05a2cfe7ae75f4e5ba8e73c0c7303a86038682bce11f"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay", "IssueReporting_Aggregation"]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0-precompiled.2/XCTestDynamicOverlay-a9e5e21e5fd26c8b0858165579bb78a9eff2b9cfccd4a130af5090de9caa5386.xcframework.zip",
            checksum: "a9e5e21e5fd26c8b0858165579bb78a9eff2b9cfccd4a130af5090de9caa5386"
        )
    ]
)