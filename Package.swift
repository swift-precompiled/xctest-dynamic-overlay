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
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReporting-b60f6f0ba7ebec91082ffacc9abd916c379607739da8d9e1d2b428e0bf6b0dd4.xcframework.zip",
            checksum: "b60f6f0ba7ebec91082ffacc9abd916c379607739da8d9e1d2b428e0bf6b0dd4"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReportingTestSupport-86fbd3a86b6e8bd8ef0696a7c00f9d3731b828d021d4d23ce749ac3a82ba86ca.xcframework.zip",
            checksum: "86fbd3a86b6e8bd8ef0696a7c00f9d3731b828d021d4d23ce749ac3a82ba86ca"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay", "IssueReporting_Aggregation"]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/XCTestDynamicOverlay-adfd0b53096536b6d05166a9ca3f5a863a2016225cd4b36dc7b1cbe946e4d678.xcframework.zip",
            checksum: "adfd0b53096536b6d05166a9ca3f5a863a2016225cd4b36dc7b1cbe946e4d678"
        )
    ]
)