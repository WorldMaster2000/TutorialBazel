load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "FirstTestModule",
    module_name = "FirstTestModule",
    srcs = glob([
        "Source/**/*.swift",
    ]),
    copts = [
        "-warnings-as-errors",
    ],
    deps = [
    "//submodules/SSignalKit/SwiftSignalKit:SwiftSignalKit",
    "//submodules/AsyncDisplayKit:AsyncDisplayKit",
    ],
    visibility = [
        "//visibility:public",
    ],
)
