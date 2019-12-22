# Table of Contents  
- [Naming](#naming)
  - [File Naming](#file-naming)
  - [View ID Naming](#view-id-naming)
- [Dimensions](#dimensions)
  - [Height & Width](#height--width)
  - [Margins & Paddings](#margins--paddings)
- [Layouts](#layouts)
- [Strings](#strings)
- [Required Attributes](#required-attributes)
- [Text Sizes](#text-sizes)
- [Resource Placement](#resource-placement)
- [Resources storing Constants](#resources-storing-constants)
- [Debug Friendly](#debug-friendly)
  - [Tools Attributes](#tools-attributes)
  - [Outer View Group IDs](#outer-view-group-ids)

# Naming

## File Naming
Prefix file names with the type of view that they represent:

__View Types:__
- `activity_` ~ Activities
- `fragment_` ~ Fragments
- `view_` ~ Custom Views
- `item_` ~ View Items used by Recycler Views / Adapters

__Examples:__

- `activity_charts_visibility.xml`
- `fragment_schedules_services.xml`
- `item_incident_preview.xml`


## View ID Naming

- Hungarian notation indicating type
- Are camelCased.

__Examples:__
- TextView - `tvUserNameLogin` <br>
- ImageView - `ivUserAvatarGeneral` <br>
- Button - `btnSubmitSchedules` <br>
- LinearLayout - `llIncidentListHeader` <br><br>

__Rationale:__
Since Kotlin extensions immediately ingest xml views as variables, we're not using the underscore notation. Hungarian notation here helps easily know in Kotlin land whether we're dealig witha a view object or non-view object. Although Hungarian notation usually ought to be received with [mNo](https://jakewharton.com/just-say-no-to-hungarian-notation/), this helps disambiguate when populating view objects vs non-view objects. 

# Dimensions

## Height & Width
Every hard coded dimension value we use should not be added directly to the layout or drawable xml files, but rather added to `dimens.xml` and referenced from there. The only exception to this rule is when the value is `0dp`.

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
    android:id="@+id/llIncidentReportDetails"
    android:layout_width="@dimen/report_details_width"
    android:layout_height="@dimen/report_details_height">
        
```

__Rationale:__
If one were to be asked to update the height of view X, a developer would immediately go to `dimens.xml` knowing X's value is there, instead of having the developer find the right layout/xml file to update it respectively.

## Margins & Paddings
- Not hard-coded.
- Paddings/Margins values are all base 8.
- Better yet use existing Design System Value like `@dimen/small_horizontal_spacing`

## Layouts

- Always use [Constraint Layouts](https://developer.android.com/training/constraint-layout/) since they are able to _"create large and complex layouts with a flat view hierarchy (no nested view groups)"_ that are performant. Exceptions are `ScrollView` & `CardView`.

- Do not use `Relative Layout`.

- Never nest `LinearLayout` or the like inside of `ConstraintLayout` as they're intended to reduce nesting.

- Never use `layout_width=”match_parent”` for a view inside `ConstraintLayout`. Using `layout_width=”0dp”` with constraints allows for view measurement optimizations.

- Avoid `GuideLine` and `Barrier`. Although there are proper uses for these, most times it's not what you want.

## Strings

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
    android:id="@+id/tvName"
    android:text="@string/name_text_view"
    tools:text="John Doe"
    style="@style/generic_item_name_text_view"/> 
```

__Rationale:__
Allows for localization, reuse, and easier maintainability.

## Required Attributes

The following views needs these attributes defined either explicitly or by referenced style:

#### Buttons
- `textColor`
- `textSize`
- `layout_height`
- `layout_width`

#### TextViews
- `textColor`
- `textSize`
- `ellipsize`
- `maxLines`

#### Linear Layouts
- `layout_height`
- `layout_width`
- `orientation`

## Text Sizes
- Defined in `sp` and not in `dp`.
- Even numbered size.
- Minimum of `12sp`.
- Not hardcoded.
- Better yet use an existing Design System Value like `@dimen/small_text_size`.

## Resource Placement

Wherever possible XML resource files should be used:

- Animations => `res/anim/`
- Arrays => `res/values/arrays.xml`
- Colors => `res/color/colors.xml`
- Drawable => `res/drawable`
- Floats => `res/values/floats.xml`
- Integers => `res/values/integers.xml`
- Strings => `res/values/strings.xml`
- Styles => `res/values/styles.xml`

## Resources storing Constants
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
Notice now `search_type_wait_ms` can now be reused across different pages with its location not as ambiguous than say the first page to ever define it in Java/Kotlin.


# Debug Friendly
## Tools Attributes 
- Always place & leave debug values on xml views for values that aren't hardcoded. 
- Make views that are invisible/gone visible in debug mode.

__Example:__
```xml
<ViewGroup 
  xmlns:tools="http://schemas.android.com/tools">

  <TextView
      android:id="@+id/tvName"
      android:visibility="gone"
      tools:visibility="visible"
      tools:text="John Doe"/> 
```
__Rationale:__
Allows for easier development & maintainability. Instead of having to run the app to see how the xml would look like, the developer could quickly switch to design mode & see its look. ["When you build your app, the build tools remove these attributes so there is no effect on your APK size or runtime behavior."](https://developer.android.com/studio/write/tool-attributes)

## Outer View Group IDs

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
    android:id="@+id/vg_root_user_account"
```


__Rationale:__
Adding unique root view ids is immensely helpful when debugging using the `Layout Inspector`.