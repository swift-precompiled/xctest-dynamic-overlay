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
            name: "IssueReportingPackageSupport_Aggregation",
            dependencies: [.target(name: "IssueReportingPackageSupport")]
        ),
        .binaryTarget(
            name: "IssueReportingPackageSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.7.0/IssueReportingPackageSupport.xcframework.zip",
            checksum: "6f2dd5d68c65a67105d1bcb81f5abe83610f19f9c6ce06750f2210242c50e730"
        ),
        .target(
            name: "IssueReporting_Aggregation",
            dependencies: [.target(name: "IssueReporting"), "IssueReportingPackageSupport_Aggregation"]
        ),
        .binaryTarget(
            name: "IssueReporting",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.7.0/IssueReporting.xcframework.zip",
            checksum: "ca3350071f08ead1969d40d279cf63d9176a3194ae0276e164d138be414945f7"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: [.target(name: "IssueReportingTestSupport"), "IssueReportingPackageSupport_Aggregation"]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.7.0/IssueReportingTestSupport.xcframework.zip",
            checksum: "948a6e9667da99339caec6075f2804230613e6164b0cb154f94c1999b8f5ce69"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: [.target(name: "XCTestDynamicOverlay"), "IssueReporting_Aggregation"]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.7.0/XCTestDynamicOverlay.xcframework.zip",
            checksum: "e7160c4018e4e103609835dfc2a66a2487bef62f9476a16b6cd3acbefe8415cc"
        )
    ]
)