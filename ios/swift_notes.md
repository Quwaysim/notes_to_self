Access Control:
================
- internal - this is the default  <br>
- private <br>
- private(set) : getting it fine by others, but setting it is private <br>
- fileprivate : accessible by source file only <br>
- public: can be used by objects out of framework <br>
- open: public objects can subclass <br>

Array:
=======
```swift
for (index, item) in array.enumerated() {
    array[index] = "foo"
}
for index in 0...10 {
    
}

for i in stride(from: 0.5, through: 15.24, by: 0.3) {
    
}
```

Any
===
- used for backward compatibility <br>
- Any & AnyObject(for classes only) <br>

Casting
========
```swift
if let foo = unknownType as? Type {
   foo.bar()
}
```

Computed Properties:
==================
```swift
var foo: Double {
    	 get {

	     }
		set(newValue) {

			      }
}
```

Closure
========
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

Data
=====
bag of bits object <br>

Error
=====
```swift
fatalError("new run time error")
```

Guard:
======
```swift
guard let currentValue = foo ?? bar else { return }
guard position > 0 else { return }
if let foo = bar {
}
```

Enum:
======
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

Variable Reference:
===================
strong foo: Bar? // normal reference counter <br>
weak foo: Bar? // don't keep in heap in my counter <br>
unowned // keep reference but doesn't up count, meant to break memory cycle of referencing foo <=> bar <br>

Protocol:
=========
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

String
=======
var index = "Foo".startIndex // return String.Index and not an Int <br>
Strings are arrays of Characters <br>
Indexing Strings return unicode <br>
`print("Card number: \(cardNumber)")` <br>


Switch:
=======
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

Structs:
========
final, can't inherit <br>
By Value, they copy on write <br>
Ints, Strings, Dictionaries are structs <br>
val someStruct = otherStruct // is a copy <br>

Tuple:
========
like a struct <br>
kinda like a data class in kotlin <br>


Target-action
==============
- selector: identifies the method to be invoked
- action-message: message to send
- target: the object to receive the message

Try
===
```
do {
   try someThrowingMethod() // all throwable methods need a try
} catch let error {
  bar(error)
  throw error
}

try! someThrowingMethod()
let x = try? someThrowingMethod()
```

NSAttributedString
==================
ObjC class, that allows a string be rich with attributes. <br>

NSRange
=======
To apply attributes to a subset of characters within a string <br>
let pizzaJoint - "Cafe pesto" <br>
cat attrString = NSMutableAttributedString(string: pizzaJoint) <br>
let firstWordRange = pizzaJoint.startIndex..<pizzaJoint.indexOf(" ")! <br>
let nsrange - NSRange(firstWordRange, in: pizzaJoint) // convert Range<String.Index> <br>
attrString.addAttribute(.strokeColor, value: UiColor.orange, range: nsrange) <br>

NSObject
========
Root object for all objc objects <br>
