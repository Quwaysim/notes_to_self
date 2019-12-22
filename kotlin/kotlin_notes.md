### Getters // Setters
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

### this
```kotlin
existingUser.apply {
    this.cookie = this@SessionManager.cookie
}
```

### loops
```kotlin
for (index in 0 until stockPrices.size) {
}
for (index in stockPrices.indices) {
}
for ((index, element) in stockPrices.iterator().withIndex()) {
}
```

### constructors
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