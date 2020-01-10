Storyboard vs Code
==========
I’m fan of coding. And not because it’s so great but because Storyboards are so bad. I’m writing in thread to not begin fight on main thread.
My reasons are following:
- Storyboards cause merge conflicts
- Storyboards are set of hardcoded values, it means you cannot easily change all fonts or colors for some labels just by changing one value across all app, some will tell you that you can fix it later in code so watch next point
- Duplicated “code”, because not all can be set in Storyboards like rounded corners for labels, so you need to post configure this label in viewDidLoad. It creates two places where you need to configure label.
- Forgotten bindings. It’s really easy to forget about then and you have to go back, load this slow Stroryboard and bind @IBOutlet or @IBAction
- Bugs in Storyboards (I had many of them, wasting of time to write about them here)
- More complex views are nightmare in Storybaords
- Weak reusability of views and view controller (but you have there aliases, so it’s not so bad)
- I could write about it even more.
- Difficult debugging of constraints.

Determine Build Type
==========
Info.plist file:
```
<key>Configuration</key>
<string>${CONFIGURATION}</string>
```
```swift
var config = Bundle.main.infoDictionary?["Configuration"] as? String ?? ""
```

Carthage
=========
```
carthage update --platform iOS
carthage build --platform iOS
carthage update --platform iOS --no-use-binaries
```

CocoaPods
==========
```
pod install
pod update
```
