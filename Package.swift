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
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0-precompiled.1/IssueReporting-5e44c7ac03d26132f97eff09a426358eebd305ce0bb62815251dfe988bc5a87c.xcframework.zip",
            checksum: "5e44c7ac03d26132f97eff09a426358eebd305ce0bb62815251dfe988bc5a87c"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0-precompiled.1/IssueReportingTestSupport-4a26614e25d870de2c7c271d407f00a8438e9c0a299c19e1d7e0f2dc7926470f.xcframework.zip",
            checksum: "4a26614e25d870de2c7c271d407f00a8438e9c0a299c19e1d7e0f2dc7926470f"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay", "IssueReporting_Aggregation"]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0-precompiled.1/XCTestDynamicOverlay-469a95160cbaae02ae1a8a8b1b26e602f170e775fceae20bfa8721a3e635f3e1.xcframework.zip",
            checksum: "469a95160cbaae02ae1a8a8b1b26e602f170e775fceae20bfa8721a3e635f3e1"
        )
    ]
)