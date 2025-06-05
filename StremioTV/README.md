# StremioTV

This directory contains a sample tvOS application that integrates with the [Stremio Core Swift](https://github.com/Stremio/stremio-core-swift) library. The goal is to provide a starting point for building a native Stremio client for Apple TV.

The sample uses SwiftUI and targets tvOS 15+. It fetches catalogs from official Stremio add-ons and allows basic playback using `AVPlayer`.

## Structure
- `Package.swift` – Swift Package configuration referencing `StremioCore` as a dependency.
- `Sources/StremioTVApp/StremioTVApp.swift` – Application entry point.
- `Sources/StremioTVApp/ContentView.swift` – Minimal UI that lists trending movies.

To build the app open this folder in Xcode and run on a tvOS simulator or device.
