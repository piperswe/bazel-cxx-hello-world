{
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
  rec {
    packages.bazel-cxx-hello-world = pkgs.buildBazelPackage {
      pname = "bazel-cxx-hello-world";
      version = "HEAD";
      src = ./.;
      bazel = pkgs.bazel_6;
      bazelTarget = "//src:hello";
      bazelTestTargets = ["//..."];
      nativeBuildInputs = [
        pkgs.jdk11
      ];
      buildAttrs = {
        installPhase = ''
          install -Dm755 bazel-bin/src/hello $out/bin/hello
        '';
      };
      fetchAttrs = {
        # This is the hash of the output of the fixed output derivation that fetches
        # the remote resources needed for the Bazel build
        sha256 = "sha256-/iwPwtJBOboujFZHU5WJJAo7Z3/8l/SbBQWBxUmY+Jw=";
      };
    };
    packages.default = packages.bazel-cxx-hello-world;
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        bazel_6
        nixpkgs-fmt
        jdk11
      ];
    };
  });
}
