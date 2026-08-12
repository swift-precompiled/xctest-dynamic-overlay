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
            targets: ["IssueReporting"]
        ),
        .library(
            name: "IssueReportingTestSupport",
            targets: ["IssueReportingTestSupport"]
        ),
        .library(
            name: "XCTestDynamicOverlay",
            targets: [
                "XCTestDynamicOverlay",
                "IssueReporting",
                "XCTestDynamicOverlay_PrecompiledProduct"
            ]
        )
    ],
    targets: [
        .target(
            name: "IssueReporting_Aggregation",
            dependencies: ["IssueReporting"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "IssueReporting",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReporting-779d8ccc6d90d35c761e96629e58f9687fbe2201ced8c25484d8d8d81d074b99.xcframework.zip",
            checksum: "779d8ccc6d90d35c761e96629e58f9687fbe2201ced8c25484d8d8d81d074b99"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReportingTestSupport-e5ee2d54c9d0e69118d2cc9ab11834e67eb9ca9017c8bf918447e1ba7c0e5ef6.xcframework.zip",
            checksum: "e5ee2d54c9d0e69118d2cc9ab11834e67eb9ca9017c8bf918447e1ba7c0e5ef6"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/XCTestDynamicOverlay-fdddffe5bc87b952a229189d694ea593159e794dd508bd46b551b55451aa20de.xcframework.zip",
            checksum: "fdddffe5bc87b952a229189d694ea593159e794dd508bd46b551b55451aa20de"
        ),
        .target(
            name: "XCTestDynamicOverlay_PrecompiledProduct",
            dependencies: ["XCTestDynamicOverlay_Aggregation", "IssueReporting_Aggregation"],
            packageAccess: false
        )
    ]
)