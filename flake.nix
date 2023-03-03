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
      bazelTarget = "//:hello";
      buildAttrs = {
        installPhase = ''
          install -Dm755 bazel-bin/hello $out/bin/hello
        '';
      };
      fetchAttrs = {
        sha256 = "sha256-pST4R45mWC5j0ngkkRe+hmostaMploW0+BN3WKPt0t0=";
      };
    };
    packages.default = packages.hello;
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        bazel_6
        nixpkgs-fmt
      ];
    };
  });
}
