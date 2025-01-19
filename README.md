# Serverino QR Code Creator Demo

A minimal demonstration of using Serverino to create a self-contained QR code generator web application. This project showcases how to build a completely standalone executable (<1.5MB) that runs on any Linux system without installation or external dependencies.

## Key Features

- Single binary executable (<1.5MB)
- Zero external dependencies
- No installation required
- Runs on any Linux system
- Self-contained web server and QR code generator
- No external files or resources needed

## Overview

This demo illustrates the power of Serverino for creating lightweight, portable web applications. The entire application, including the web server and QR code generation capabilities, is compiled into a single binary that can be executed directly on any Linux system.

## Usage

Simply download the executable on release page and run it:
```bash
./serverino-demo
```

or build the project with:

```bash
dub
```

Then open your browser to `http://localhost:8080` to start generating QR codes.
