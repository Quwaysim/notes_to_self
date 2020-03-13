# Table of Contents
- [1. Comments](#1-Comments)
- [2. TODOs](#2-todos)
- [3. Immutability](#3-immutability)
- [4. Derive Values](#4-derive-values)
- [5. Avoid Nesting](#5-avoid-nesting)
- [6. Single Purpose Files](#6-single-purpose-files)
- [7. No-ops](#7-no-ops)
- [8. Call a spade a spade](#8-call-a-spade-a-spade)
- [9. Naming](#9-naming)

# 1. Comments
## 1.1 File Headers
- Headers should not contain author nor dates; we have source control for that. <br>
- Basic description can be provided if necessary. <br>

__BAD__:

```kotlin
/**
 * An alert dialog
 * @author foo
 * Created: 5/1/2018
 */
```

__GOOD__:

```kotlin
/*
 * This class does foo when bar.
 */
```

## 1.2 Regular Comments
- Comments should not state the obvious.
- Comments should state why we're doing something strange.

__BAD__:

```kotlin
// get user's name
val userName = userNameEditText.text
```

__GOOD__:

```kotlin
// USA requires legal names in full caps
val fullName = fullNameEditText.text.capitalized()
```

Prefer methods and variables over comments.

__BAD__:

```kotlin
// checks to see if using secure url
if (url.startsWith("https://")) {
```

__GOOD__:

```kotlin
if (isSecureUrl(url)) {
 // ..
}

fun isSecureUrl(url: String) = url.startsWith("https://")
```

Avoid leaving commented out code. In rare circumstances leave TODOs along with it.

# 2. TODOs
- TODOs shouldn't be placed at all costs, instead done there an then if possible. <br>
- If placed, it's best to place a ticket id alongside it. <br>
- If placed & possible, raise as a project warning that shows during builds. <br>

# 3. Immutability

- Prefer using immutable data to mutable. <br>
- Always declare local variables and properties as a immutable if not modified post initialization. <br>
- Always use immutable collection interfaces (Collection, List) for collection return types of methods.

# 4. Derive Values

Avoid hardcoding values and prefer deriving them.

__BAD__:

```kotlin
val daysOfWeek = "Days of week: 7"
```

__GOOD__:

```kotlin
enum class DaysOfWeek {
  MONDAY, TUESDAY, WEDNESDAY, ...
}
val daysOfWeek = "Days of week: ${DaysOfWeek.values().count}"
```

# 5. Avoid Nesting
Prefer early returns instead; it saves on mental overhead.

__BAD__:

```kotlin
fun method() {
  if (foo) {
    // ..
  } else if (bar) { 
    // ..
  } else {
    // ..
  }
}
```

__GOOD__:

```kotlin
fun method() {
  if (foo) {
    // ..
    return
  }
  if (bar) { 
    // ..
    return
  }
  // ..
}
```

# 6. Single Purpose Files
Avoid files containing multiple classes or interfaces. <br>

_"Do you want your tools organized into toolboxes with many small drawers each containing well-defined and well-labeled components? Or do you want a few drawers that you just toss everything into?"_ - Uncle Bob from "Clean Code"

# 7. No-ops
Say no to no-ops
`x = x;`

# 8. Call a spade a spade
Try not to use primitive placeholder values for more complex ideas, instead create a class/enum for them.

__BAD__:

```kotlin
val MONDAY = 1
val TUESDAY = 2
...

print("Monday's day of the week is: $MONDAY")
```

__GOOD__:

```kotlin
enum class DaysOfWeek(val dayOfWeek: Int, val name) {
  MONDAY(1, "Monday"), TUESDAY(2, "Tuesday"), ...
}

print("${MONDAY.name}'s day of the week is: ${MONDAY.dayOfWeek}")
```

# 9. Naming
## 9.1 Classes
- Keep free of abbreviations.
- Keep free of domain/company specific suffixes.

## 9.2 Methods
- Name indicates action.
- Name begins with a verb: `is`, `get`, `set`, etc.
