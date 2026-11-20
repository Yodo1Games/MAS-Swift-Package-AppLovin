// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationApplovin",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationApplovin", targets: ["Yodo1MasMediationApplovinTarget"]),
        .library(name: "Yodo1MasMediationApplovin-AppLovinAdapter", targets: ["Yodo1MasMediationApplovin-AppLovinAdapterTarget"]),
        .library(name: "Yodo1MasMediationApplovin-A11MediationAppLovinMAXAdapter", targets: ["Yodo1MasMediationApplovin-A11MediationAppLovinMAXAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Aurion11.git", exact: "5.0.0-beta.5"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationApplovin ====================
        .target(
            name: "Yodo1MasMediationApplovinTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationApplovin"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
            ],
            path: "Sources/Yodo1MasMediationApplovinTarget",
            resources: [.copy("Yodo1MasAppLovin.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationApplovin",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationApplovin/Yodo1MasMediationApplovin-5.0.0-beta.5.zip",
            checksum: "1da3a9dca4d933e43f34125a59fba193ef1b555b86e20c1cdee461dbc41ccb66"
        ),
        // ==================== Yodo1MasMediationApplovin-AppLovinAdapter ====================
        .target(
            name: "Yodo1MasMediationApplovin-AppLovinAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationApplovinTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "AppLovinAdapter"),
            ],
            path: "Sources/Yodo1MasMediationApplovin-AppLovinAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationApplovin/AppLovinAdapter-5.0.0-beta.5.zip",
            checksum: "9456b3d9f6b2436b94ec061f18a925bca934f78024d68642cfc77f4100e072fe"
        ),
        // ==================== Yodo1MasMediationApplovin-A11MediationAppLovinMAXAdapter ====================
        .target(
            name: "Yodo1MasMediationApplovin-A11MediationAppLovinMAXAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationApplovinTarget"),
                .product(name: "Yodo1MasMediationAurion11-A11Mediation", package: "MAS-Swift-Package-Aurion11"),
                .product(name: "Yodo1MasMediationAurion11-A11MediationRenderer", package: "MAS-Swift-Package-Aurion11"),
                .product(name: "Yodo1MasMediationAurion11-OMSDK_Aurion11", package: "MAS-Swift-Package-Aurion11"),
                .target(name: "A11MediationAppLovinMAXAdapter"),
            ],
            path: "Sources/Yodo1MasMediationApplovin-A11MediationAppLovinMAXAdapterTarget"
        ),
        .binaryTarget(
            name: "A11MediationAppLovinMAXAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationApplovin/A11MediationAppLovinMAXAdapter-5.0.0-beta.5.zip",
            checksum: "55c78fb48e5b028e5271859f5a7adfe390a86fb9f91565b1323c1633d8ed2633"
        ),
    ]
)
