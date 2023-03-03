load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "com_google_googletest",
  urls = ["https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip"],
  strip_prefix = "googletest-1.13.0",
  sha256 = "ffa17fbc5953900994e2deec164bb8949879ea09b411e07f215bfbb1f87f4632"
)

http_archive(
    name = "hedron_compile_commands",
    urls = ["https://github.com/hedronvision/bazel-compile-commands-extractor/archive/752014925d055387ff4590a9862fb382350b0e5d.tar.gz"],
    strip_prefix = "bazel-compile-commands-extractor-752014925d055387ff4590a9862fb382350b0e5d",
    sha256 = "9a68018c9120a636e60988b265c85e56f169a1408ed0c6bd164dd3a6996a9b36"
)
load("@hedron_compile_commands//:workspace_setup.bzl", "hedron_compile_commands_setup")
hedron_compile_commands_setup()