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
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReporting-4d19a05e644db695492f031852ed829423804faf323f5a882063811f7fe93426.xcframework.zip",
            checksum: "4d19a05e644db695492f031852ed829423804faf323f5a882063811f7fe93426"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReportingTestSupport-8de2e713ba6f1a8ee058c47a8b3588547dca7aeff6bfbf8ae48e1096d9fac54e.xcframework.zip",
            checksum: "8de2e713ba6f1a8ee058c47a8b3588547dca7aeff6bfbf8ae48e1096d9fac54e"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay", "IssueReporting_Aggregation"]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/XCTestDynamicOverlay-a167e7ff2e4ad04cda5ed70f97bcd7dfebe4718e7b05b12fd5e071e95016fafa.xcframework.zip",
            checksum: "a167e7ff2e4ad04cda5ed70f97bcd7dfebe4718e7b05b12fd5e071e95016fafa"
        )
    ]
)