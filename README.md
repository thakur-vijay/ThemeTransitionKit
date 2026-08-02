# ThemeTransitionKit

A lightweight SwiftUI library for creating smooth animated light ↔ dark
theme transitions using view snapshots.

## Features

-   ✨ Circular reveal style theme transition
-   ⚡️ Async/await API
-   🎯 Trigger animation from any view
-   🪶 Lightweight SwiftUI integration
-   🛡️ Typed errors with recovery guidance
-   📦 Distributed as a binary Swift Package

## Requirements

-   iOS 18.0+
-   Swift 6
-   Xcode 16+

## Installation

Add the package using Swift Package Manager.

``` swift
dependencies: [
    .package(url: "https://github.com/thakur-vijay/ThemeTransitionKit.git", from: "1.0.0")
]
```

## Quick Start

### 1. Wrap your app

``` swift
@main
struct DemoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .themeTransition()
        }
    }
}
```

### 2. Add a trigger

Attach `.themeTrigger()` to the view that should act as the animation
origin.

``` swift
Button {

    Task {

        do {

            try await transition.animate()
            isDarkMode.toggle()

        } catch {

            print(error.localizedDescription)

        }
    }

} label: {
    Image(systemName: "moon.fill")
}
.themeTrigger()
```

## How it works

When `animate()` is called, ThemeTransitionKit:

1.  Captures the current interface.
2.  Switches the preferred color scheme.
3.  Captures the updated interface.
4.  Plays the animated reveal originating from the trigger view.
5.  Completes only after snapshot preparation has finished.

Because `animate()` is asynchronous, your UI state changes only after
the transition is ready.

## Environment

Access the transition manager through the environment.

``` swift
@Environment(\.themeTransition)
private var transition
```

## Error Handling

``` swift
Task {

    do {

        try await transition.animate()
        isDarkMode.toggle()

    } catch {

        print(error.localizedDescription)

    }
}
```

Possible errors:

  -----------------------------------------------------------------------
  Error                           Meaning
  ------------------------------- ---------------------------------------
  `containerMissing`              Root view is not wrapped with
                                  `.themeTransition()`.

  `triggerMissing`                No `.themeTrigger()` was attached.

  `transitionAlreadyRunning`      Another transition is currently
                                  executing.

  `windowNotFound`                No active key window was found.

  `snapshotFailed`                Snapshot generation failed.

  `transitionCancelled`           Transition task was cancelled.
  -----------------------------------------------------------------------

## Public API

### ThemeTransition

``` swift
func animate() async throws
```

Starts a theme transition and suspends until snapshot preparation
finishes.

### View Modifiers

``` swift
.themeTransition()
```

Wraps your root SwiftUI hierarchy and installs ThemeTransitionKit.

``` swift
.themeTrigger()
```

Marks the animation origin.

## Best Practices

-   Apply `.themeTransition()` once at the root of your app.
-   Apply `.themeTrigger()` only to the control that starts the
    transition.
-   Always call `animate()` from a `Task`.
-   Handle errors using `do` / `catch`.
-   Wait for the current transition to finish before starting another.

## Common Mistakes

❌ Forgetting `.themeTransition()`.

❌ Calling `animate()` without a trigger.

❌ Starting multiple transitions simultaneously.

## License

MIT
