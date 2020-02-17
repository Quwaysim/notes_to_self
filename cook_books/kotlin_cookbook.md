# Constructors
```kotlin
class Foo(val bar: String) {
  val foo = bar
  val nom: String
  init {
    nom = bar + "nom"
  }
  constructor(lol: String, count: Int) : this(lol)  {      
  }
}
```

# Getters // Setters
```kotlin
val cookieCount: String get() {
    if (jar.isEmpty()) {
        return "Grab some cookies"
    }
    return "No cookies for you"
}

val cookie: String get() = "Cookie time"

var cookie: String = ""
    get() = field
    set(value) {
        field = value
	    buildApi()
	    }
```

# Generics
Invariant:
Generic types in Java are invariant, meaning that List<String> is not a subtype of List<Object>.
```java
List<String> strs = new ArrayList<String>();
List<Object> objs = strs; // !!! The cause of the upcoming problem sits here. Java prohibits this!
objs.add(1); // Here we put an Integer into a list of Strings
String s = strs.get(0); // !!! ClassCastException: Cannot cast Integer to String
```
Covariant:

# Loops
```kotlin
for (index in 0 until stockPrices.size) {
}
for (index in stockPrices.indices) {
}
for ((index, element) in stockPrices.iterator().withIndex()) {
}
```

# Scope
```kotlin
existingUser.apply {
    this.cookie = this@SessionManager.cookie
}
```

