## Access Attributes
Java:
```
Res.getColorViaAttr(context, android.R.attr.colorAccent)
?attr/actionBarSize // works only for non-custom attrs
```

XML:
```
android:background="?android:colorForeground"
android:background="?android:attr/colorForeground"
```