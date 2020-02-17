# Table of Contents  
- [1. Naming](#1-naming)
- [2. Brace Style](#2-brace-style)
- [3. When Statements](#3-when-statements)
- [4. Visibility Modifiers](#4-visibility-modifiers)
- [5. Prefer Data Classes](#5-prefer-data-classes)
- [6. Semicolons](#5-semicolons)
- [7. Getters & Setters](#5-getters-&-setters)
- [8. Early returns](#8-early-returns)
- [9. Method Formatting](#9-method-formatting)
- [10. Using Loops](#10-using-loops)
- [11. Strings](#11-strings)
- [12. Scope Functions](#12-scope-functions)
- [13. Whitespacing](#13-whitespacing)

# 1. Naming
## 1.1 Packages

Package names are all __lowercamelcase__, multiple words concatenated together, without hypens or underscores:

__BAD__:

```kotlin
com.company.funky_widget
```

__GOOD__:

```kotlin
com.company.funkywidget
```

## 1.2 Classes & Interfaces

Written in __UpperCamelCase__. For example `RadialSlider`.

## 1.3 Methods

- Written in __lowerCamelCase__. For example `setValue`.
- Always stating a verb indicating its intent `getFoo`, `setBar`, `changeFoo`.
- Method orders should go in override first and in alphabetical order.
- Ought to always explicitly declare return type.

## 1.4 Fields

- All fields should be written in __lowerCamelCase__.
- Static constant fields should be written in __uppercase__ & in the companion object.
- *Do not* prefix member variables with `m`.
- *Do not* prefix static field names with an `s`.
- Each variable should get its own declaration line.
- Single character names should be avoided except for temporary looping variables.
- Acronyms should be treated as words, ie `URL` should be `Url`.
- Obvious variable types can be implicitly declared.
- Non-obvious variable types should be explicitly declared.

__BAD__:

```kotlin
private val someConstant = 42;
class MyClass {
  val mFooField: Int = 5
  val mBarField = "foo".length  
  lateinit var URL: String
}
```

__GOOD__:

```kotlin
class MyClass {
  val fooField = 5
  val barField: Int = "foo".length  
  lateinit var Url: String
  
  companion object {
    const val SOME_CONSTANT = 42
  }
}
```

# 2. Brace Style

- Opt to ["Walk Like an Egyptian"](https://www.youtube.com/watch?v=Cv6tuzHUuuk) when placing braces.

__BAD:__

```kotlin
class MyClass
{
  fun doSomething()
  {
    if (someTest)
    {
      // ...
    }
    else
    {
      // ...
    }
  }
}
```

__GOOD:__

```kotlin
class MyClass {
  fun doSomething() {
    if (someTest) {
      // ...
    } else {
      // ...
    }
  }
}
```

# 3. When Statements

- When you have if else conditions exceeding 2 conditions, opt to a `when` statment.
- Separate cases using commas if they should be handled the same way. 
- Always include the else case.

__BAD:__

```kotlin
if (anInput == 1) {
  doSomethingForCaseOneOrTwo()
} else if (anInput == 2) { 
  doSomethingForCaseOneOrTwo()
} else if (anInput == 3) {
  doSomethingForCaseThree()
}
```

__BAD:__

```kotlin
when (anInput) {
  1 -> { doSomethingForCaseOneOrTwo() }
  2 -> doSomethingForCaseOneOrTwo()
  3 -> doSomethingForCaseThree()
}
```

__GOOD:__

```kotlin
when (anInput) {
  1, 2 -> doSomethingForCaseOneOrTwo()
  3 -> doSomethingForCaseThree()
  else -> println("No case satisfied")
}
```

# 4. Visibility Modifiers

Only include visibility modifiers if you need something other than the default of public.

__BAD:__

```kotlin
public val foo = 1
private val bar = "bar"
```

__GOOD:__

```kotlin
val foo = 1
private val bar = "bar"
```

# 5. Prefer Data Classes

Prefer data classes for simple data holding objects.

__BAD:__

```kotlin
class Person(val name: String) {
  override fun toString() : String {
    return "Person(name=$name)"
  }
}
```

__GOOD:__

```kotlin
data class Person(val name: String)
```

# 6. Semicolons

Semicolons should be avoided wherever possible.


# 7. Getters & Setters

Unlike Java, direct access to fields in Kotlin is preferred.

__BAD:__

```kotlin
val foo: String
fun getFoo(): String = foo.trim()
```

__GOOD:__
```kotlin
val foo: String
  get() { foo.trim() }
```

# 8. Early returns

Always create local variables against Optionals & early return.

__BAD:__

```kotlin
fun foo() {
  bar?.let{ 
    println("$it") 
  }
}
```

__GOOD:__

```kotlin
fun foo() {
  val someBar = bar ?: return 
  println("$someBar") 
}
```

# 9. Method Formatting
## 9.1 Multiline signatures 
If the function signature doesn't fit on a single line, use the following syntax:

__GOOD:__

```kotlin
fun longMethodName(
    foo: String = "",
    bar: Bar
): String {
    // body
}
```

## 9.2 Expression bodies over expression blocks
Prefer using an expression body for methods with the body consists of a single expression.

__BAD:__

```kotlin
fun foo(): Int {
    return 1 
}
```

__GOOD:__

```kotlin
fun foo() = 1
```

## 9.3 Return method blocks concisely
__BAD:__

```kotlin
fun foo(anInput): Int {
 when (anInput) {
  "foo" -> return 3
  "bar" -> return 5
}
```

__BETTER:__

```kotlin
fun foo(anInput): Int {
 return when (anInput) {
  "foo" -> 3
  "bar" -> 5
}
```

__BEST:__

```kotlin
fun foo(anInput): Int =
 when (anInput) {
  "foo" -> 3
  "bar" -> 5
}
```

## 9.4 Name Arguments

Use the named argument syntax when a method takes multiple parameters, unless the meaning of all parameters is absolutely clear from context.

__BAD:__

```kotlin
drawSquare(10, 10, 100, 100, true)
```

__GOOD:__

```kotlin
drawSquare(x = 10, y = 10, width = 100, height = 100, fill = true)
```


# 10. Using Loops
## 10.1 High Order first
Prefer using higher-order functions like `filter` & `map` to loops

__BAD:__

```kotlin
for (foo in bars) {
  println("$foo")
}
```
__GOOD:__

```kotlin
bars.map { println("$it") }  
```


## 10.2 Ranges
Use `until`  to loop over ranges:

__BAD:__

```kotlin
for (i in 0..n - 1) { /*...*/ } 
```
__GOOD:__

```kotlin
for (i in 0 until n) { /*...*/ }  
```

# 11. Strings
## 11.1 Use string templates

__BAD:__

```kotlin
println(name + "has " + children.size + " children") 
```
__GOOD:__

```kotlin
println("$name has ${children.size} children")  
```

## 11.2 Multiline
Prefer to use multiline strings instead of embedding `\n` escape sequences into regular string literals.

__BAD:__

```kotlin
val string = "Foo \n Bar" 
```
__GOOD:__

```kotlin
val string = """
Foo
Bar
""".trimIndent()  
```
# 12. Scope Functions
Make good use of `let`, `run`, `with`, `apply`, and `also`. Refer to their documentation [here.](https://kotlinlang.org/docs/reference/scope-functions.html)

# 13. Whitespacing
Never put a space after `(`, `[`, or before `]`, `)`.

__BAD:__

```kotlin
if( foo) bar() 
```
__GOOD:__

```kotlin
if (foo) bar()
```

Never put a space around `.` or `?.`

__BAD:__

```kotlin
foo?. bar()
```

__GOOD:__

```kotlin
foo?.bar()
```

Put a space after `//`: 

__GOOD:__

```kotlin
// This is a comment
```

Always put a space after `:`.
Always put a space before `:` except when defining type of method, or variable.

__BAD:__

```kotlin
abstract class Foo<out T:Any>: IFoo {
    abstract fun foo(a : Int) :T
}
```
__GOOD:__

```kotlin
abstract class Foo<out T : Any> : IFoo {
    abstract fun foo(a: Int): T
}
```
