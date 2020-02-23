# Access Control
- `internal` - this is the default  <br>
- `private` <br>
- `private(set)` : getting it fine by others, but setting it is private <br>
- `fileprivate`: accessible by source file only <br>
- `public`: can be used by objects out of framework <br>
- `open`: public objects can subclass <br>

# Arrays
### Creation
```swift
var techTickerSet = Set<String>() // Empty

var empty:[Int] = []

var numbers = ["one", "two", "three","one"]  // Mutable

let numbers = Array(1...10) // 1 through 10

let numbers9 = Array(1..<10) // 1 through 9

let numbers0_9 = [Int](0..<10)

var numbers = Array(repeating: 0, count: 100)

var emptyStrArray = Array(repeating: "", count: 100)

let multDim:[[Int]] = [[1,2,3], [4,5,6], [7,8,9]]
```

### Access
```swift
array.first // nil if empty

array[0] // Error if empty

if array.contains("three") {

}

array.index(of: "one")

let x = array.index(where: {$0 > 10}) // finds first value matching
```

### Sort
```swift
let sortedArray = array.sorted()

let reversed =  array.sorted(by: >)
```

# For
```swift
for (index, item) in array.enumerated() {
    array[index] = "foo"
}

for index in 0...10 {
    
}

for i in 0..<10 {

}

for i in stride(from: 0.5, through: 15.24, by: 0.3) {
    
}
```

# Any
- used for backward compatibility <br>
- Any & AnyObject(for classes only) <br>

# Casting
```swift
if let foo = unknownType as? Type {
   foo.bar()
}
```

# Computed Properties:
```swift
var foo: Double {
    get {

    }
    set(newValue) {

    }
}
```

# Closure
Reference Type ~ Meaning scoped variables will too be referenced in the heap, meaning you need to be careful of those variables later changing <br>
	       ~ Also means if your closure references the class it's in, it can cause a memory cycle/leak that  <br>can be avoided with `unowned` access <br>

```swift
var operation: (Double) -> Double
operation = sqrt <br>
let result = operation(4.0) <br>

func changeSign(operand: Double) -> Double { return -operand }
var changeSignInline = { (operand: Double) -> Double in return -operand }
var changeSignInline = { (operand: Double) in return -operand }
var changeSignInline = { (operand) in return -operand }
var changeSignInline = { (operand) in -operand }
var changeSignInline = { ($0 in -$0 }
var changeSignInline = { -$0 }

let numbers = [2.0, 3.0, 5.0]
let negativeNumbers = numbers.map( { -$0 } )
let negativeNumbers = numbers.map() { -$0 }  // trailing closures
let negativeNumbers = numbers.map{ -$0 } // sole closure
```

# Data
bag of bits object <br>

# Dictionary
### Creation
```swift
var dictionary:[String:String] = [:] 

dictionary = ["foo": "bar",
              "bar": "foo"]

let dictionary = ["foo": 200, "bar": 50]
```

### Access
```swift
let keyCount = dictionary.count

dictionary.keys // all keys

let value = dictionary["key"]!

if let value = dictionary["key"] {

}

for (key, value) in dictionary.sorted(by: { $0.0 < $1.0 }) {
    print("=>\(key), \(value)")

}
```

### Modify
```swift
dictionary["key"] = "value"
dictionary.updateValue("value", forKey: "key")
dictionary.removeValue(forKey: "key")
dictionary.removeAll()
```

# Error
```swift
fatalError("new run time error")
```

# Functional
## map
```swift
[1,2,3].map {$0 * 2}
```

## forEach
```swift
[fooView, barView].forEach (view.addSubview) 
```

# Guard
```swift
guard let currentValue = foo ?? bar else { return }
guard position > 0 else { return }
if let foo = bar {
}
```

# Enum
```swift
enum FastFoodMenuItem {
     case hamburger(numberOfPatties: Int)
     case fries(size: FryOrderSize)
     case drink(String, ounces: Int)
     case cooke
}

enum FryOrderSize {
     case large
     case small
}
switch menuItem {
       case FastFoodMenuItem.hamburger: print("burger")
       case .cookie: print("cookie")	
       case .fries: break
       case foo, bar: bar()
       case hamburger(let pattCount): print(\(pattyCount))
       default: print("other")
}
```

Enum with ability to get count & position
```swift
enum ReportingIntervals: Int, CaseIterable {
    case SECONDS_5
    case SECONDS_10
 
   public static func getPositionOf(_ position: Int) -> ReportingIntervals? {
        return ReportingIntervals.allCases[position]
    }
}

let ordinal = currentReportingInterval.rawValue
let nextReportingInterval = ReportingIntervals.getPositionOf(ordinal + 1)
```

# Variable Reference
`strong foo: Bar?` // normal reference counter <br>
`weak foo: Bar?` // don't keep in heap in my counter <br>
`unowned` // keep reference but doesn't up count, meant to break memory cycle of referencing foo <=> bar <br>

# Protocol
```swift
protocol FooProtocol : class, BarProtocol { // makes class only protocol
	 var fooProperty: Int { get, set }
	 func someMethod(varg1: Double, anotherArg: String) -> Int
	 func method(intenseVar: BarProtocol & FooBarProtocol)
	 init(arge: Type)
}

protocol FooProtocol : BarProtocol {
	 var fooProperty: Int { get, set }
	 mutating func someMethod(varg1: Double, anotherArg: String) -> Int
	 init(arge: Type) // subclasses need to mark it as required
}

extension Int : SomeProtocol {
	  
}

protocol Equatable {
	 static fun ==(lhs: Self, rhs: Self) -> Bool
}
```
Cool to implement: <br>
     - CountableRange, indexOf(foo) <br>
     - Sequence, iterator() ~ "for in" <br>
     - Collection, foo[4] <br>
```swift
extension  FooProtocol {
    var fooProperty = 5
    // default implementation

}
```

# Strings
- Strings are arrays of Characters <br>
- Indexing Strings return unicode <br>
### Creation

```swift
let str = """
some 
multiline
string
"""
```

### Accessors
```swift
var index = "Foo".startIndex // return String.Index and not an Int
print("Card number: \(cardNumber)")` <br>

let stringLength = str.count

for character in "hello world" {
    print(character)
}
```

### Comparison
```swift
if str == "Hello world" {
    print("Strings are Equal")
}
if str.caseInsensitiveCompare("Hello world") == .orderedSame { // NSComparisonResult
    print("Strings are equal")
}
```

### Modify
```swift
str.append('a')

let array = csv.components(separatedBy: ",")
let csv = row.replacingOccurrences(of: " ", with: ",") // import Foundation

url.hasPrefix("https:")
url.hasSuffix("/")

var blogTitle = "  Swift Cookbook  ".trimmingCharacters(in: NSCharacterSet.whitespaces)

let capitalized = str.capitalized
let localizedCapitalized = str.localizedCapitalized
```

# Switch
```swift
subscript<T>(dynamicMember member: KeyPath<B, T>) -> String? {
    switch T.self {
    case is String.Type:
        return "W/e"
    case is Int.Type:
        return "Int"
    default:
        return "nil"
    }
}
```

# Structs
final, can't inherit <br>
By Value, they copy on write <br>
Ints, Strings, Dictionaries are structs <br>
val someStruct = otherStruct // is a copy <br>

# Tuple
like a struct <br>
kinda like a data class in kotlin <br>


# Target-action
- selector: identifies the method to be invoked
- action-message: message to send
- target: the object to receive the message

# Try
```swift
do {
   try someThrowingMethod() // all throwable methods need a try
} catch let error {
  bar(error)
  throw error
}

try! someThrowingMethod()
let x = try? someThrowingMethod()
```

# NSAttributedString
ObjC class, that allows a string be rich with attributes. <br>

# NSRange
To apply attributes to a subset of characters within a string <br>
```swift
let pizzaJoint = "Cafe pesto"
cat attrString = NSMutableAttributedString(string: pizzaJoint)
let firstWordRange = pizzaJoint.startIndex..<pizzaJoint.indexOf(" ")!
let nsrange = NSRange(firstWordRange, in: pizzaJoint) // convert Range<String.Index>
attrString.addAttribute(.strokeColor, value: UiColor.orange, range: nsrange)
```

# NSObject
Root object for all objc objects <br>
