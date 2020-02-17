# Table of Contents  
- [1. Logging](#1-Logging)
- [2. Class member ordering](#2-class-member-ordering)
- [3. Parameter ordering](#3-parameter-ordering)
- [4. Factory Methods](#4-factory-methods)
- [5. Image Assets](#5-image-assets)
- [6. Theme](#6-theme)

# 1. Logging

Use the appropriate logging level.
```java
Log.v(String tag, String msg); // verbose
Log.d(String tag, String msg); // debug
Log.i(String tag, String msg); // information
Log.w(String tag, String msg); // warning
Log.e(String tag, String msg); // error
```

As a general rule, we use the class name as tag:
```java
public class Foo {
    private static final String TAG = Foo.class.getSimpleName();

    public bar() {
        Log.e(TAG, "error message");
    }
}
```

Wrap all logging methods such that VERBOSE and DEBUG logs are disabled on release builds.

# 2. Class member ordering

1. Constants (sorted visibility)
2. Fields (sorted visibility)
3. Constructors
4. Override lifecycle methods (sorted chronologically)
5. Public methods
6. Private methods
7. Click listener implementation
8. Inner classes or interfaces

# 3. Parameter Ordering

`Context` if amongst parameters, ought to be first. <br> 
Callback interfaces that should always be the last parameter.
 
 ```java
 public void loadUserAsync(Context context, int userId, UserCallback callback);
 ```

# 4. Factory Methods
## 4.1 Activity Factory Method
Activities shouldn't have a launcher method that launch themselves.
Activity factory methods should create the Intent to launch it, usually called `getStartIntent()`
Activity shouldn't expose its Extra keys, nor Result keys instead have static methods that utilize them accordingly. 

```java
 public static Intent getStartIntent(Context context, User user) {
     Intent intent = new Intent(context, ThisActivity.class);
     intent.putParcelableExtra(EXTRA_USER, user);
     return intent;
 }
``` 

## 4.2 Fragment Factory Method
Fragment shouldn't expose its Argument keys, nor Result keys. 
Fragments should include `newInstance()` that handles the creation of the Fragment with the right arguments:

```java
public static UserFragment newInstance(User user) {
    UserFragment fragment = new UserFragment();
    Bundle args = new Bundle();
    args.putParcelable(ARGUMENT_USER, user);
    fragment.setArguments(args)
    return fragment;
}
```

## 4.3 Variable naming

| Element            | Field Name Prefix |
| -----------------  | ----------------- |
| SharedPreferences  | `PREF_`             |
| Bundle             | `BUNDLE_`           |
| Fragment Arguments | `ARGUMENT_`         |
| Intent Extra       | `EXTRA_`            |
| Intent Action      | `ACTION_`           |

# 5. Image Assets

When possible use SVGs, which are then coverted to VectorDrawables, over PNGs.
Should you use PNG try providing all sizes for it `mdpi`, `hpdi`, `xhpdi`, etc.

# 6. Theme

Opt to use an app wide theme for coloring all widgets in the application.
It may be harder to define all colors, but saves development time down the line.
