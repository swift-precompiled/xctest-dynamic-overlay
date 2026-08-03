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
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReporting-dba07bfcc6d7bf8c89e99ac9461939473fe3eacbd04bb620206fec323536a29c.xcframework.zip",
            checksum: "dba07bfcc6d7bf8c89e99ac9461939473fe3eacbd04bb620206fec323536a29c"
        ),
        .target(
            name: "IssueReportingTestSupport_Aggregation",
            dependencies: ["IssueReportingTestSupport"]
        ),
        .binaryTarget(
            name: "IssueReportingTestSupport",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/IssueReportingTestSupport-4cdda19d00cb1cc6842384c170187a594f6e2a61981fc5a7c0f992ce53f4563d.xcframework.zip",
            checksum: "4cdda19d00cb1cc6842384c170187a594f6e2a61981fc5a7c0f992ce53f4563d"
        ),
        .target(
            name: "XCTestDynamicOverlay_Aggregation",
            dependencies: ["XCTestDynamicOverlay", "IssueReporting_Aggregation"]
        ),
        .binaryTarget(
            name: "XCTestDynamicOverlay",
            url: "https://github.com/swift-precompiled/xctest-dynamic-overlay/releases/download/1.11.0/XCTestDynamicOverlay-4071ce36ddef444a7bb0a7b79b650aa2a85c010a5af9871974d6beb20f1bb4a4.xcframework.zip",
            checksum: "4071ce36ddef444a7bb0a7b79b650aa2a85c010a5af9871974d6beb20f1bb4a4"
        )
    ]
)