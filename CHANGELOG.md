All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-04-27
### Added
- **Initial Release:**
    - Introduced the `AnimatedClockIndicator` widget, enabling developers to add animated clock indicators to their Flutter applications.
    - Developed the `AnimatedClockIndicatorOptions` class, providing extensive customization options for border width, hand widths, colors, rotation durations, and ratios.
    - Implemented a named constructor `withUniformColor` in `AnimatedClockIndicatorOptions` for applying a single color to all clock elements, ensuring aesthetic harmony.
    - Ensured performance optimization by incorporating an internal `RepaintBoundary`, preventing unnecessary repaints.
    - Comprehensive documentation and usage examples included to facilitate easy integration and customization.