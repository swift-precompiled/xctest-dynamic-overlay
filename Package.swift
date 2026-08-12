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
            targets: ["IssueReporting_PrecompiledProduct"]
        ),
        .library(
            name: "IssueReportingTestSupport",
            targets: ["IssueReportingTestSupport_PrecompiledProduct"]
        ),
        .library(
            name: "XCTestDynamicOverlay",
            targets: ["XCTestDynamicOverlay_PrecompiledProduct"]
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
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReporting-9d238f4764d30a62f353cfef37f3b0cf51ddb26d67dbcddc5e846c6b82866271.xcframework.zip",
            checksum: "9d238f4764d30a62f353cfef37f3b0cf51ddb26d67dbcddc5e846c6b82866271"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReportingTestSupport-34c2351c3b2b43d4d9bff13357daf6ecdcc0edab1875bddfbe3659065819d37e.xcframework.zip",
            checksum: "34c2351c3b2b43d4d9bff13357daf6ecdcc0edab1875bddfbe3659065819d37e"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/XCTestDynamicOverlay-c450077c1e3e2cea84572d30f8cb30218001de30c872282f4074b937d2966dcd.xcframework.zip",
            checksum: "c450077c1e3e2cea84572d30f8cb30218001de30c872282f4074b937d2966dcd"
        ),
        .target(
            name: "IssueReporting_PrecompiledProduct",
            dependencies: ["IssueReporting_Aggregation"]
        ),
        .target(
            name: "IssueReportingTestSupport_PrecompiledProduct",
            dependencies: ["IssueReportingTestSupport_Aggregation"]
        ),
        .target(
            name: "XCTestDynamicOverlay_PrecompiledProduct",
            dependencies: ["XCTestDynamicOverlay_Aggregation", "IssueReporting_Aggregation"]
        )
    ]
)