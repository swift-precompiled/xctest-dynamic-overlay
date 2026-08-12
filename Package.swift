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
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "IssueReporting",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReporting-cfcc46d1e3a798a3b1691950b6145849b26f845a56d940fb6628ec558607e2ab.xcframework.zip",
            checksum: "cfcc46d1e3a798a3b1691950b6145849b26f845a56d940fb6628ec558607e2ab"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReportingTestSupport-da1ea1670ab3ea37e87f756b9d45eb2f859cd73a9b853d3f5185cbee6b1c2a24.xcframework.zip",
            checksum: "da1ea1670ab3ea37e87f756b9d45eb2f859cd73a9b853d3f5185cbee6b1c2a24"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/XCTestDynamicOverlay-dbf70639e3bc365f2cbc90685e58f10528768986b913f8dcce2bb692b7645970.xcframework.zip",
            checksum: "dbf70639e3bc365f2cbc90685e58f10528768986b913f8dcce2bb692b7645970"
        ),
        .target(
            name: "XCTestDynamicOverlay_PrecompiledProduct",
            dependencies: ["XCTestDynamicOverlay_Aggregation", "IssueReporting_Aggregation"]
        )
    ]
)