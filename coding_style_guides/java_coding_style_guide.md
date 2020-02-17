# Table of Contents  
- [1. Naming](#1-naming)
- [2. Brace Style](#2-brace-style)
- [3. Switch Statements](#3-switch-statements)
- [4. Annotations](#4-annotations)
- [5. Final when final](#5-final-when-final)
- [6. Protect your fields](#6-protect-your-fields)
- [7. Class member ordering](#7-class-member-ordering)
- [8. Imports](#8-imports)
- [9. Exceptions](#9-exceptions)

# 1. Naming
## 1.1 Packages

Package names are all __lowercamelcase__, multiple words concatenated together, without hypens or underscores:

__BAD__:

```java
com.company.funky_widget
```

__GOOD__:

```java
com.company.funkywidget
```

## 1.2 Classes & Interfaces

Written in __UpperCamelCase__. For example `RadialSlider`.

## 1.3 Methods

- Written in __lowerCamelCase__. For example `setValue`.
- Always stating a verb indicating its intent `getFoo`, `setBar`, `changeFoo`.
- Method orders should go in override first, visibility second (public to private), in alphabetical order.

## 1.4 Fields

- All fields should be Written in __lowerCamelCase__.
- Static fields should be written in __uppercase__.
- *Do not* prefix member variables with `m`.
- *Do not* prefix static field names with an `s`.
- Each variable should get its own declaration line.
- Single character values to be avoided except for temporary looping variables.
- Acronyms should be treated as words, ie `URL` should be `Url`.

__BAD__:

```java
public class MyClass {
  public static final int someConstant = 42;
  private static MyClass sSingleton;
  public int publicField, someField;
  int mSomeMemberField;
  Query q;
  String URL;
}
```

__GOOD__:

```java
public class MyClass {
  public static final int SOME_CONSTANT = 42;
  private static MyClass singleton;
  public int publicField;
  public int someField;
  int someMemberField;
  Query query;
  String url;
}
```

# 2. Brace Style
Opt to ["Walk Like an Egyptian"](https://www.youtube.com/watch?v=Cv6tuzHUuuk) when placing braces.

__BAD:__

```java
class MyClass
{
  void doSomething()
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

```java
class MyClass {
  void doSomething() {
    if (someText == null) return;
    // ...
  }
}
```

__GOOD:__

```java
class MyClass {
  void doSomething() {
    if (someTest) {
      // ...
    } else {
      // ...
    }
  }
}
```

```java
class MyClass {
  void doSomething() {
    if (someText == null) {
      return;
    }
    // ...
  }
}
```
If the condition and the body fit on one line & is shorter than the max line length, then braces are not required

__BAD:__

```java
if (foo)
    bar()
```
__GOOD:__

```java
if (foo) bar();
```

# 3. Switch Statements

Switch statements fall-through by default, but this can be unintuitive. If you require this behavior, comment it. <br>
Alway include the `default` case. <br>

__BAD:__

```java
switch (anInput) {
  case 1:
    doSomethingForCaseOne();
  case 2:
    doSomethingForCaseOneOrTwo();
    break;
  case 3:
    doSomethingForCaseOneOrThree();
    break;
}
```

__GOOD:__

```java
switch (anInput) {
  case 1:
    doSomethingForCaseOne();
    // fall through
  case 2:
    doSomethingForCaseOneOrTwo();
    break;
  case 3:
    doSomethingForCaseOneOrThree();
    break;
  default:
    break;
}
```

# 4. Annotations

Standard annotations should be used - in particular `@Override`. This should appear the line before the function declaration.

__BAD:__

```java
protected void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
}
```

__GOOD:__

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
}
```

The @SuppressWarnings annotation should only be used under circumstances where it is impossible to eliminate a warning. <br>
Suppressing should be placed right over the offending line as opposed to the method it lies in.

# 5. Final when final

- Use `final` when possible in creating variables. It helps read code and describe intent with the variable.
- Also use `final` on classes that you feel should be final.

# 6. Protect your fields

- Use `protected`, `private`, as much as you can
- Avoid `public` field variables at all costs.

# 7. Class member ordering

1. Constants
2. Fields (static, non-static, and by visibility)
3. Constructors  (static, non-static, and by visibility)
4. Override methods
5. Public methods
6. Protected methods
7. Private methods
8. Private callbacks
9. Inner classes or interfaces

# 8. Imports

Fully qualify imports & avoid wildcards.

__BAD:__

```java
import foo.*;
```

__GOOD:__

```java
import foo.Bar;
```
# 9. Exceptions

Don't catch generic exceptions.

__BAD:__

```java
try {
    foo();
} catch (Exception e) {
    handleError();
}
```

__GOOD:__

```java
try {
    foo();
} catch (NumberFormatException e) {
    handleError();
} catch(InstantiationException e) {
    throw new IllegalArgumentException("poor foo argument passed");
}
```
Don't ignore exceptions

__BAD:__

```java
try {
    foo();
} catch (Exception e) { }
```

*Rationale:* You may suppress errors that become a lot harder to debug down the road once they appear.
