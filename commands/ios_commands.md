Remove derived data
```
~/Library/Developer/Xcode/DerivedData/
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache
```

Clean project
```
shift + cmd + k
shift + cmd + Alt + k 
```

Exit Debugger
```
repl
```

Print debugger variables
```
po [variable name]
```

Carthage
```
brew install carthage
carthage update --platform iOS
carthage build --platform iOS
```

Pod
```
sudo gem install cocoapods
pod install
pod update
```
