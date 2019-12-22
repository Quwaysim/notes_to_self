### AnyView
BAD
```swift
var body: some View {
    if Bool.random() {
        Image("example-image")
    } else {
        Text("Better luck next time")
    }
}
```

GOOD
```swift
var body: some View {
    Group {
        if Bool.random() {
            Image("example-image")
        } else {
            Text("Better luck next time")
        }
    }
}
```

GOOD but costly
```swift
var body: AnyView {
    if Bool.random() {
        return AnyView(Image("example-image"))
    } else {
        return AnyView(Text("Better luck next time"))
    }
}
```

### For Each
```swift
VStack(alignment: .leading) {
    ForEach((1...10).reversed()) {
        Text("\($0)…")
    }

    Text("Ready or not, here I come!")
}
```

```swift
struct ContentView : View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack {
            ForEach(colors.identified(by: \.self)) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
        }
    }
}
```

### Sizes
```swift
struct ContentView : View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        if horizontalSizeClass == .compact {
            return Text("Compact")
        } else {
            return Text("Regular")
        }
    }
}
```

### UnSafe Area
```swift
Text("Hello World")
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.red)
    .edgesIgnoringSafeArea(.all)
```