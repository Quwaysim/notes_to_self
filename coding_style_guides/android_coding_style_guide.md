# Table of Contents  
- [1. Logging](#1-Logging)
- [2. Class member ordering](#2-class-member-ordering)
- [3. Parameter ordering](#3-parameter-ordering)
- [4. Factory Methods](#4-factory-methods)
- [5. Image Assets](#5-image-assets)
- [6. Theme](#6-theme)
- [7. Modules](#7-modules)
- [8. Lifecycles](#8-lifecycles)
- [9. RecyclerViews](#9-recyclerviews)

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

Never use `e.printStackTrace` when logging.

Wrap all logging methods such that VERBOSE and DEBUG logs are disabled on release builds.

# 2. Class member ordering

1. Constants (sorted by visibility).
2. Fields (sorted by visibility).
3. Constructors.
4. Override lifecycle methods (sorted chronologically).
5. Override methods (sorted by interface).
6. Public methods.
7. Private methods.
8. Click listener implementation.
9. Inner classes or interfaces.

# 3. Parameter Ordering

`Context`, if amongst parameters, ought to be first. <br> 
Callback interfaces, if amongst parameters, ought to be last. <br> 
 
 ```java
 public void loadUserAsync(Context context, int userId, UserCallback callback);
 ```

# 4. Factory Methods
## 4.1 Activity Factory Method
Activities shouldn't have launcher methods that launch themselves. <br>
Activity factory methods should create `Intent`s that launch it such as `getStartIntent()`. <br>
Activities shouldn't expose their `Extra` nor `Result` keys, instead rely on public static methods that utilize them accordingly. <br> 

```java
 public static Intent getStartIntent(Context context, User user) {
     Intent intent = new Intent(context, ThisActivity.class);
     intent.putParcelableExtra(EXTRA_USER, user);
     return intent;
 }
``` 

## 4.2 Fragment Factory Method
Fragments shouldn't expose neither their `Argument` or `Result` keys. <br>
Fragments should include `newInstance()` that handles the creation of themselves with the right arguments. <br>

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

When possible use SVGs, which are then coverted to VectorDrawables, over PNGs. <br>
Should you have to use PNGs, try providing all of its sizes: `mdpi`, `hpdi`, `xhpdi`, etc. <br>
VectorDrawables ought to reference colors from app theme and rarely hardcode colors. <br>

# 6. Theme

Opt to use an app wide theme for coloring all widgets in the application. <br>
It may be harder to define all colors, but saves development time down the line. <br>

# 7. Modules

Create modules with clear dependencies, especially when dependencies are metaphorically apparant.

# 8. Lifecycles

- Understand [Android Lifecycles](https://developer.android.com/guide/components/activities/activity-lifecycle) and follow them accordingly.
- Avoid adding fragments using `commitAllowingStateLoss`.
- Subscribe & unsubscribe in the right places.

# 9. RecyclerViews

- Ensure related ItemView holders are their own classes.
- Use DiffUtil where appropriate.
- Ensure adapter is free of business logic.
