# Table of Contents  
- [Naming](#naming)
  - [Packages](#packages)
  - [Classes & Interfaces](#classes--interfaces)
  - [Methods](#methods)
  - [Fields](#fields)
- [Brace Style](#brace-style)
- [Switch Statements](#switch-statements)
- [Annotations](#annotations)
- [Final when final](#final-when-final)
- [Protect your fields](#protect-your-fields)

## Naming
### Packages

Package names are all __lower-camel-case__, multiple words concatenated together,
without
hypens or underscores:

__BAD__:

```java
com.company.funky_widget
```

__GOOD__:

```java
com.company.funkyWidget
```

### Classes & Interfaces

Written in __UpperCamelCase__. For example `RadialSlider`.

### Methods

- Written in __lowerCamelCase__. For example `setValue`.
- Always stating a verb indicating its intent `getFoo`, `setBar`, `changeFoo`
- Method orders should go in override first and in alphabetical order

### Fields

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

## Brace Style

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

## Switch Statements

Switch statements fall-through by default, but this can be unintuitive. If you
require this behavior, comment it.

Alway include the `default` case.

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

## Annotations

Standard annotations should be used - in particular `@Override`. This should
appear the line before the function declaration.

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

## Final when final

- Use `final` when possible in creating variables. It helps read code and describe intent with the variable.
- Also use `final` on classes that you feel should be final.

## Protect your fields

- Use `protected`, `private`, as much as you can
- Avoid `public` field variables at all costs.