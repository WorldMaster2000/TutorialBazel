load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_framework",
 )
 
load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

load("@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

load("//bazel-utils:plist_fragment.bzl",
    "plist_fragment",
)

filegroup(
    name = "Icons",
    srcs = glob([
        "testApp/Assets.xcassets/**/*",
    ], exclude = []),
)

filegroup(
    name = "AppResources",
    srcs = glob([
        "testApp/Base.lproj/*",
    ], exclude = []),
)

swift_library(
    name = "Main",
    srcs = glob([
        "testApp/AppDelegate.swift",
        "testApp/SceneDelegate.swift",
        "testApp/ViewController.swift",
    ]),
    data = [
        ":Icons",
        ":AppResources",
    ],
)

plist_fragment(
    name = "BuildNumberInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleVersion</key>
    <string>0.0.1</string>
    """
)

plist_fragment(
    name = "VersionInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleShortVersionString</key>
    <string>0.0.1</string>
    """
)

plist_fragment(
    name = "RequiredDeviceCapabilitiesPlist",
    extension = "plist",
    template =
    """
    <key>UIRequiredDeviceCapabilities</key>
    <array>
        <string>arm64</string>
    </array>
    """
)

plist_fragment(
    name = "SwiftSignalKitInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleIdentifier</key>
    <string>VG.testapp.org.SwiftSignalKit</string>
    <key>CFBundleDevelopmentRegion</key>
    <string>en</string>
    <key>CFBundleName</key>
    <string>SwiftSignalKit</string>
    <key>CFBundlePackageType</key>
    <string>FMWK</string>
    """
)

ios_framework(
    name = "SwiftSignalKitFramework",
    bundle_id = "VG.testapp.org.SwiftSignalKit",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        ":SwiftSignalKitInfoPlist",
        ":BuildNumberInfoPlist",
        ":VersionInfoPlist",
        ":RequiredDeviceCapabilitiesPlist",
    ],
    minimum_os_version = "11.0",
    extension_safe = True,
    deps = [
        "//submodules/SSignalKit/SwiftSignalKit:SwiftSignalKit",
    ],
)

plist_fragment(
    name = "AsyncDisplayKitInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleIdentifier</key>
    <string>VG.testapp.org.AsyncDisplayKit</string>
    <key>CFBundleDevelopmentRegion</key>
    <string>en</string>
    <key>CFBundleName</key>
    <string>AsyncDisplayKit</string>
    <key>CFBundlePackageType</key>
    <string>FMWK</string>
    """
)

ios_framework(
    name = "AsyncDisplayKitFramework",
    bundle_id = "VG.testapp.org.AsyncDisplayKit",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        ":AsyncDisplayKitInfoPlist",
        ":BuildNumberInfoPlist",
        ":VersionInfoPlist",
        ":RequiredDeviceCapabilitiesPlist",
    ],
    minimum_os_version = "11.0",
    extension_safe = True,
    deps = [
        "//submodules/AsyncDisplayKit:AsyncDisplayKit",
    ],
)

ios_application(
    name = "ios-app",
    bundle_id = "VG.testapp.org",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [":testApp/Info.plist"],
    minimum_os_version = "13.0",
    provisioning_profile = "testapp.mobileprovision",
    visibility = ["//visibility:public"],
    frameworks = [
        ":SwiftSignalKitFramework",
        ":AsyncDisplayKitFramework",
    ],
    deps = [
        ":Main",
    ],
)

xcodeproj(
    name = "xcodeproj",
    build_mode = "bazel",
    project_name = "ios-app",
    tags = ["manual"],
    top_level_targets = [
        top_level_target(":ios-app", target_environments = ["device", "simulator"]),
    ],
)
