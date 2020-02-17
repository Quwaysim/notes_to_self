# Table of Contents  
- [1. Naming](#1-naming)
- [2. Dimensions](#2-dimensions)
- [3. Layouts](#3-layouts)
- [4. Strings](#4-strings)
- [5. Required Attributes](#5-required-attributes)
- [6. Resource Placement](#6-resource-placement)
- [7. Debug Friendly](#7-debug-friendly)
- [8. Closing Tags](#8-closing-tags)
- [9. Attributes Ordering](#9-attributes-ordering)

# 1. Naming

## 1.1 File Naming

### 1.1.1 Class File Naming
- Class names are written in UpperCamelCase.
- Name should end with the name of the extending component if any, such as `FooActivity`

### 1.1.2 Layout File Naming
- Prefix file names with the type of view that they represent:

| Type   | Prefix            |        Example               |
|--------------| ------------------|-----------------------------|
| Activity   | `activity_`             |  `activity_home.xml`          |
| Dialog   | `dialog_`             |  `dialog_yes_no.xml`          |
| Toolbar   | `toolbar_`             |  `toolbar_home.xml`          |
| Custom View   | `view_`             | `view_avatar.xml`          |
| Item ViewHolder   | `item_`             |  `toolbar_home.xml`          |
| Menu         | `menu_    `           |  `menu_settings.xml`     |

### 1.1.3 Drawable File Naming
Naming conventions for selector states:

| State           | Suffix          | Example                     |
|--------------|-----------------|-----------------------------|
| Normal       | `_normal`       | `btn_foo_normal.xml`    |
| Pressed      | `_pressed`      | `btn_foo_pressed.xml`   |
| Focused      | `_focused`      | `btn_foo_focused.xml`   |
| Disabled     | `_disabled`     | `btn_foo_disabled.xml`  |
| Selected     | `_selected`     | `btn_foo_selected.xml`  |

## 1.2 (XML/Kotlin) View Naming

- Suffix class type
- CamelCased.

| Type           | Suffix          | Example                     |
|--------------|-----------------|-----------------------------|
| Button       | `Button`       | `submitSchedulesButton`    |
| ImageView       | `ImageView`       | `userAvatarGeneralImageView`    |
| TextView       | `TextView`       | `userNameLoginTextView`    |
| LinearLayout       | `LinearLayout`       | `schedulesLinearLayout`    |

__Rationale:__
Since Kotlin extensions immediately ingests xml views as variables via extensions, we're not using the underscore notation as one normally does. Suffixing view type here helps easily know in Kotlin code whether we're dealing with a view object or non-view object.

# 2. Dimensions

## 2.1 Height & Width
Hard coded dimension values should *not* be added directly to xml files, but rather added to `dimens.xml`, and referenced from there. The only exception to this rule is when the value is `0dp`.

__BAD:__

```xml
<Linear Layout
    android:id="@+id/llIncidentReportDetails"
    android:layout_width="400dp"
    android:layout_height="200dp">

```

__GOOD:__

```xml
<Linear Layout
    android:id="@+id/incidentReportDetailsLinearLayout"
    android:layout_width="@dimen/report_details_width"
    android:layout_height="@dimen/report_details_height">
        
```

__Rationale:__
If one were to be asked to update the height of view X, a developer would immediately go to `dimens.xml` knowing X's value is there, instead of having the developer find the right layout/xml file to update it respectively.

## 2.2 Margins & Paddings
- Not hard-coded.
- Paddings/Margins values are all base 8.
- Use existing design value system values such as `@dimen/s_horizontal_spacing`

## 2.3 Text Sizes
- Defined in `sp` and not in `dp`.
- Even numbered size.
- Minimum of `12sp`.
- Not hardcoded.
- Use an existing design value system Value like `@dimen/s_text_size`.
- Better yet reference a Text Appearance that includes size, font, and attributes.

# 3. Layouts

- Always use [Constraint Layouts](https://developer.android.com/training/constraint-layout/) since they are able to _"create large and complex layouts with a flat view hierarchy (no nested view groups)"_ that are performant.

- `ScrollView` & `CardView` are the exceptions in being root views.

- Never use `Relative Layout`. Period.

- Never use `layout_width=”match_parent”` for a view inside `ConstraintLayout`. Using `layout_width=”0dp”` with constraints allows for view measurement optimizations.

- Never nest layouts inside of `ConstraintLayout` since they're intended to reduce nesting.

# 4. Strings

Every string value we use should not be added directly to the layout xml files, but rather added to `strings.xml` unless using the `tools` prefix for debugging purposes:

__BAD:__
```xml
<TextView
    android:id="@+id/name_text_view"
    android:text="NAME TEXT VIEW"/>
```

__GOOD:__

```xml
<TextView
    android:id="@+id/nameTextView"
    android:text="@string/name_text_view"
    tools:text="John Doe"
    style="@style/generic_item_name_text_view"/> 
```

__Rationale:__
Allows for localization, reuse, and easier maintainability.

# 5. Required Attributes

The following views needs these attributes defined either explicitly or by referenced style:

## 5.1 Buttons
- `textColor`
- `textSize`
- `layout_height`
- `layout_width`

## 5.2 TextViews
- `textColor`
- `textSize`
- `ellipsize`
- `maxLines`

## 5.3 Linear Layouts
- `layout_height`
- `layout_width`
- `orientation`

# 6. Resource Placement

## 6.1 File placement of resources

Wherever possible XML resource files should be used:

| Type           | Folder          |
|--------------|-----------------|
| Animations       | `res/anim/`       |
| Arrays       | `res/values/arrays.xml`       |
| Colors       | `res/color/colors.xml`       |
| Drawable       | `res/drawable`       |
| Floats       | `res/values/floats.xml`       |
| Integers       | `res/values/integers.xml`       |
| Strings       | `res/values/strings.xml`       |
| Styles       | `res/values/styles.xml`        |

## 6.2 Constants as Resources 
Resources can store more than `strings`, `dimens`, & `colors`; they too can store `floats` & `integers` that can be used within the app as constants. 

__BAD:__
```java
RxTextView.textChanges(searchTextView)
    .debounce(100, TimeUnit.MILLISECONDS)
```

__BETTER:__
```java
public static final int SEARCH_TYPE_WAIT_MS = 100;
...
RxTextView.textChanges(searchTextView)
    .debounce(SEARCH_TYPE_WAIT_MS, TimeUnit.MILLISECONDS)
```

__MUCH BETTER:__
```java
@BindInt(R.integers.search_type_wait_ms) int SEARCH_TYPE_WAIT_MS;
...
RxTextView.textChanges(searchTextView)
    .debounce(SEARCH_TYPE_WAIT_MS, TimeUnit.MILLISECONDS)
```
```xml
<!-- integers.xml -->
<integer name="search_type_wait_ms">100</integer>
```
__Rationale:__
- Notice now `search_type_wait_ms` can now be reused across different pages with its location not as ambiguous than say the first page to ever define it in Java/Kotlin.
- Resource files are now more so a place to configure the application.


# 7. Debug Friendly
## 7.1 Tools Attributes 
- Always place & leave debug values on xml views for values that aren't hardcoded. 
- Make views that are invisible/gone visible in debug mode.

__Example:__
```xml
<ViewGroup 
  xmlns:tools="http://schemas.android.com/tools">

  <TextView
      android:id="@+id/nameTextView"
      android:visibility="gone"
      tools:visibility="visible"
      tools:text="John Doe"/> 
```
__Rationale:__
Allows for easier development & maintainability. Instead of having to run the app to see how the xml would look like, the developer could quickly switch to design mode & see its look. ["When you build your app, the build tools remove these attributes so there is no effect on your APK size or runtime behavior."](https://developer.android.com/studio/write/tool-attributes)

## 7.2 Outer View Group IDs

Give every layout's root view group a unique id that follows xml id naming conventions.

__BAD:__
```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/generic_item_root_view"
```

__GOOD:__
```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/userAccountViewGroup"
```


__Rationale:__
Adding unique root view ids is immensely helpful when debugging using the `Layout Inspector`.

# 8. Closing Tags

When an XML element doesn't have any contents, use self closing tags.

__BAD:__
```xml
<TextView
    android:id="@+id/userTextView"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content">
</TextView>
```

__GOOD:__
```xml
<TextView
    android:id="@+id/userTextView"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content" />
```

# 9. Attributes Ordering
1. View Id.
2. Layout width and layout height.
3. `android:` attributes, sorted alphabetically.
4. `app:` attributes, sorted alphabetically.
5. Style.
6. `tools:`.
