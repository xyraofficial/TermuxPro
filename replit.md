# Termux App

## Overview

Termux is an Android terminal emulator application that provides a Linux command line environment on mobile devices. The app allows users to run shells (Bash, Zsh), use command-line utilities, access servers via SSH, compile code, and run text-based applications. The core app supports optional plugins for extended functionality including API access, boot scripts, floating windows, styling, Tasker integration, and home screen widgets.

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Platform & Build System
- **Platform**: Native Android application
- **Build System**: Gradle-based Android build (standard Android project structure)
- **Language**: Java (primary), with native components via JNI (NativeDispatcher)
- **Minimum Requirements**: Android OS (specific version defined in build configuration)

### Module Structure
The project follows a multi-module architecture:

1. **Main App Module** (`termux-app`)
   - Terminal emulator UI and user interaction
   - Terminal emulation engine (derived from Android-Terminal-Emulator project)
   - Session management for terminal instances

2. **Shared Library Module** (`termux-shared`)
   - Reusable components across Termux app and plugins
   - Utilities: file operations, shell management, logging, notifications
   - Settings management (SharedPreferences and properties files)
   - Crash handling and error reporting
   - Android system utilities and view helpers

### Key Architectural Patterns

- **Plugin Architecture**: Core app designed to work with separate plugin APKs (API, Boot, Float, Styling, Tasker, Widget) that extend functionality
- **Shared Library Pattern**: Common code extracted to `termux-shared` for reuse across all Termux applications
- **Native Bridge**: JNI layer for low-level filesystem operations not available through standard Android APIs

### Terminal Emulation
- Based on the Terminal Emulator for Android project (Apache 2.0 licensed)
- Provides VT100/ANSI terminal emulation
- Manages PTY (pseudo-terminal) sessions for shell processes

### Settings & Configuration
- **SharedPreferences**: For app settings and state persistence
- **Properties Files**: For terminal and environment configuration
- Dedicated parser and constants classes for type-safe property access

## External Dependencies

### Base System
- **Bootstrap Packages**: On first launch, downloads and configures a minimal Linux environment with GNU Bash, Coreutils, Findutils, and other core utilities
- **Package Repository**: Access to 1000+ packages via Termux package management (separate termux-packages repository)

### Distribution
- **F-Droid**: Primary distribution channel
- **GitHub Releases**: Alternative distribution
- **JitPack**: Library releases for plugin development

### Plugin Integrations
The app is designed to integrate with companion plugin apps:
- **Termux:API** - Android API access from command line
- **Termux:Boot** - Run scripts on device boot
- **Termux:Float** - Floating terminal window
- **Termux:Styling** - Terminal themes and fonts
- **Termux:Tasker** - Tasker automation integration
- **Termux:Widget** - Home screen script shortcuts

### Licensing
- Main app: GPLv3
- Terminal emulator core: Apache License 2.0 (from Android-Terminal-Emulator)
- Select shared library components: MIT License