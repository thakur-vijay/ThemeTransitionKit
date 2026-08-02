# ThemeTransitionKit

A lightweight SwiftUI package that adds a smooth, animated "reveal" transition when switching between light and dark mode — similar to the circular wipe effect seen in iOS system settings and popular productivity apps.

![Swift](https://img.shields.io/badge/Swift-5.9%2B-orange)
![Platform](https://img.shields.io/badge/iOS-17%2B-blue)
![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen)

---

## Features

- 🌗 Animated circular reveal transition between light and dark appearance
- 📍 Automatically anchors the animation to the control that triggered it (e.g. a toggle button)
- ⚡️ Built on `@Observable` and modern SwiftUI APIs (`onGeometryChange` on iOS 18+, with a `GeometryReader`/`PreferenceKey` fallback for iOS 17)
- 🧩 Minimal integration — two view modifiers and a single async call

---

## Requirements

- iOS 17.0+
- Swift 5.9+
- Xcode 15+

---

## Installation

### Swift Package Manager

Add the package to your project via **File ▸ Add Package Dependencies…** in Xcode, or add it directly to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-org/ThemeTransitionKit.git", from: "1.0.0")
]
```

Then add `"ThemeTransitionKit"` to your target's dependencies.

---

## Public API

ThemeTransitionKit exposes a small, focused public surface. Everything else in the package (overlay rendering, snapshot capture, geometry tracking) is internal implementation detail and is not part of the supported API.

| Symbol | Type | Purpose |
|---|---|---|
| `ThemeTransitionContainer` | `View` | Hosts the transition overlay for a piece of content |
| `View.themeTransition()` | Method | Convenience modifier to wrap a view in `ThemeTransitionContainer` |
| `View.themeTrigger()` | Method | Marks a view as the animation's origin point |
| `ThemeTransition` | `@Observable` class | Drives the transition; exposes `animate(action:)` |
| `ThemeTransitionError` | `LocalizedError` | Errors thrown by `animate(action:)` |
| `EnvironmentValues.themeTransition` | Environment value | Access point for the shared `ThemeTransition` instance |

### `ThemeTransitionContainer`

A container view that must wrap the part of your view hierarchy where the transition animation should render.

```swift
public struct ThemeTransitionContainer<Content: View>: View {
    public init(@ViewBuilder content: @escaping () -> Content)
}
```

Typically applied once, near the root of your app.

### `View.themeTransition()`

A convenience modifier equivalent to manually wrapping a view in `ThemeTransitionContainer`.

```swift
public extension View {
    func themeTransition() -> some View
}
```

### `View.themeTrigger()`

Marks the view that starts the transition (e.g. a dark mode toggle button) so the animation knows where to originate from.

```swift
public extension View {
    func themeTrigger() -> some View
}
```

### `ThemeTransition`

The observable model that performs the transition animation.

```swift
@Observable
public final class ThemeTransition {
    @MainActor
    public func animate(action: @escaping () -> Void) async throws
}
```

Call `animate(action:)` inside the action of your theme toggle, passing a closure that performs your actual color scheme change (e.g. flipping a stored preference or `@AppStorage` value).

### `ThemeTransitionError`

Thrown by `animate(action:)` when the transition cannot run.

```swift
public enum ThemeTransitionError: LocalizedError {
    case containerMissing
    case triggerMissing
    case transitionAlreadyRunning
    case windowNotFound
    case snapshotFailed
    case transitionCancelled
}
```

Each case provides `errorDescription`, `failureReason`, and `recoverySuggestion` for easier debugging.

### `EnvironmentValues.themeTransition`

Provides access to the shared `ThemeTransition` instance from the SwiftUI environment, in case you need to read or observe it directly (e.g. for custom UI that reacts to `isTransitioning`).

```swift
public extension EnvironmentValues {
    var themeTransition: ThemeTransition { get set }
}
```

---

## Usage

### 1. Wrap your root content

```swift
import SwiftUI
import ThemeTransitionKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .themeTransition()
        }
    }
}
```

### 2. Mark your trigger view

```swift
Button {
    // handled in step 3
} label: {
    Image(systemName: "circle.lefthalf.filled")
}
.themeTrigger()
```

### 3. Trigger the animation

```swift
@Environment(\.themeTransition) private var transition
@AppStorage("isDarkMode") private var isDarkMode = false

Button {
    Task {
        try await transition.animate {
            isDarkMode.toggle()
        }
    }
} label: {
    Image(systemName: "circle.lefthalf.filled")
}
.themeTrigger()
```

### 4. Handle errors (optional)

```swift
Task {
    do {
        try await transition.animate {
            isDarkMode.toggle()
        }
    } catch let error as ThemeTransitionError {
        print(error.localizedDescription ?? "Unknown transition error")
    }
}
```

---

## How it works

`ThemeTransitionContainer` observes the shared `ThemeTransition` instance and applies `.preferredColorScheme(_:)` based on its state. When `animate(action:)` is called:

1. A snapshot of the current UI is captured.
2. Your `action` closure runs, updating the underlying appearance state.
3. A second snapshot is captured after the change takes effect.
4. An animated circular mask reveals the "after" snapshot over the "before" snapshot, expanding outward from the view marked with `.themeTrigger()`.

---

## Error Reference

| Error | Cause | Fix |
|---|---|---|
| `containerMissing` | `animate(action:)` called before wrapping content in `ThemeTransitionContainer` | Add `.themeTransition()` near your app's root view |
| `triggerMissing` | No view has been marked with `.themeTrigger()` | Attach `.themeTrigger()` to the control that starts the transition |
| `transitionAlreadyRunning` | `animate(action:)` called while a transition is already in progress | Wait for the current transition to finish before starting another |
| `windowNotFound` | The app's key window could not be resolved | Ensure the app has an active window when calling `animate()` |
| `snapshotFailed` | Snapshot capture failed | Verify the view hierarchy can be rendered normally |
| `transitionCancelled` | The transition's underlying task was cancelled | Avoid cancelling the task while a transition is in flight |

---

## License

MIT License. See `LICENSE` for details.

---

## Contributing

Issues and pull requests are welcome. Please keep changes to the public API surface minimal and backward-compatible where possible.
