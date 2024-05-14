import ProjectDescription

let minDeploymentTarget = "16.0"

let project = Project(
    name: "AppClipExampleApp",
    targets: [
        .target(
            name: "AppClipExampleApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.AppClipExampleApp",
            deploymentTargets: .iOS(minDeploymentTarget),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["AppClipExampleApp/Sources/**"],
            resources: ["AppClipExampleApp/Resources/**"],
            dependencies: [.target(name: "AppClip")]
        ),
        .target(
            name: "AppClipExampleAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.AppClipExampleAppTests",
            deploymentTargets: .iOS(minDeploymentTarget),
            infoPlist: .default,
            sources: ["AppClipExampleApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "AppClipExampleApp")]
        ),
        .target(
            name: "AppClip",
            destinations: .iOS,
            product: .appClip,
            bundleId: "io.tuist.AppClipExampleApp.Clip",
            deploymentTargets: .iOS(minDeploymentTarget),
            entitlements: "AppClip.entitlements",
            dependencies: [.target(name: "AppClip-widget")]
        ),
        .target(
            name: "AppClip-widget",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "io.tuist.AppClipExampleApp.Clip.widget",
            deploymentTargets: .iOS(minDeploymentTarget)
        )
    ]
)
