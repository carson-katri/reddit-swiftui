<p align="center"><img src="Resources/banner.jpeg" /></p>
<h2 align="center">A cross-platform Reddit client created in SwiftUI.</h2>

> *Note:* This project is far from complete. It still lacks many features of your typical Reddit client and has bugs (partly due to SwiftUI, but I'll take credit for some of them)

To show off SwiftUI's strength in cross-platform development, I did **not** use Mac Catalyst for this project. Instead, common UI code is shared between iOS, macOS, and watchOS.

## Setup
To use this app, you need to create an app for the Reddit API. You can do that [here](https://www.reddit.com/prefs/apps). Choose "Installed app", and set the redirect URI to `redditswiftui://oauth_callback`. Then input the information you got there into the `Shared/API.plist` file. Set the scope in the plist to whatever scope you need. Start with `read,identity,vote` and add more scopes as needed.

## Project Structure
* `Shared` - Models, helpers, API, and any shared Views.
* `Reddit-[PLATFORM]` - Each target folder contains a `Views` and `Representable` folder. `Views` holds platform-specific views, and `Representable` contains `UIViewRepresentables` or `NSViewRepresentables`.

## macOS Specific Features
I've added several things to make the macOS app stand out:
1. Double click - You can double click on a post to open a new window for the detail view.
2. `NSToolbar` - This is implemented entirely in the `AppDelegate`, and uses standard Cocoa code which interfaces with the SwiftUI views.
3. `TouchBar` - TODO

## SF Symbols
Because macOS doesn't support SF Symbols, I have created the following extension to make sure shared code works. I would like to replace this with custom icons for macOS that it loads from `XCAssets` eventually:
```swift
/// `SwiftUI` compatibility
#if os(macOS)
extension Image {
    init(systemName: String) {
        self.init(nsImage: NSImage())
    }
}
#endif
```
