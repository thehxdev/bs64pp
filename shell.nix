{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
    packages = with pkgs; [
        ## compiler and build system
        llvmPackages.clang
        llvmPackages.bintools
        clang-tools
        cmake
        ninja
        gnumake

        ## debugging stuff
        gdb
        gf
        valgrind
    ];

    shellHook = ''
    export CC=clang
    export CXX=clang++
    '';
}
