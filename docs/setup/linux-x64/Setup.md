# Setup instructions and documentation for linux-x64 platforms

## Overview

This document goes over the setup steps for the linux-x64 platform of GMRT and its targets and assumes you're already familiar with the basics of GMRT and packages
For information on GMRT, installing packages, and the purposes of the `GMRT - <Platform>` and `GMRT Runtime - <Target>` packages, please see the [Introduction to GMRT](../../GMRT-beta-intro-and-setup-instructions.md) documentation

## GMRT - linux-x64

To install the platform tools and the runtime required for building for this target, you must install the `GMRT - linux-x64` package
This package includes:
  - GMRT toolchain binaries for linux-x64
  - Third party dependencies for the linux-x64 toolchain
  - The GMRT Runtime for linux-x64 (x86_64-linux-gnu)
  - Third party dependencies for the linux-x64 runtime (x86_64-linux-gnu)

## Building for Linux (GMRT Runtime - x86_64-linux-gnu)

Building for windows x64 is supported by the `GMRT Runtime - x86_64-linux-gnu` package.
Once installed, this package should allow you to select `Ubuntu` as a target for GMRT from the IDE.

## Building for WASM (GMRT Runtime - wasm32-emscripten)

Building for windows x64 is supported by the `GMRT Runtime - wasm32-emscripten` package.
Once installed, this package should allow you to select `wasm` and `GX.games` as a target for GMRT from the IDE.

When executed, GMRT should open your default browser. You will need to ensure that this browser has `wasm` and `webgpu` enabled.