### [Map](https://www.androidhive.info/RxJava/map-flatmap-switchmap-concatmap/)
- Modifies each item emitted by a source Observable and emits the modified item.
- Example: Offline operations needs to be done on emitted data. 
- Example: Response from server however needs massaging before presentation. 

### FlatMap
- Applies a function on each emitted item then returns an Observable which can emit data thereafter.
- Order is not maintained.
- Example: Want to call a bunch of different flights' prices, and display as they come.

### ConcatMap
- Applies a function on each emitted item then returns an Observable which can emit data thereafter.
- Order is maintained.
- Has to wait for each Observable to complete its work.
- Example: Want to call a bunch of different images and display in order.

### SwitchMap
- Unsubscribes from previous source Observable whenever new item started emitting, thus always emitting the items from current Observable.
- Example: Send server search query every time user types. Multiple requests are sent however will show the result of latest typed query only.
- Example: Feed is refreshed each time user pulls down to refresh. Would ignores older feed responses and emit the latest request.

### [Debounce](http://reactivex.io/documentation/operators/debounce.html)
- Emits an item from an Observable if a particular timespan has passed without it emitting another item

### Publisher
- Doesn't begin emitting items when it is subscribed, only when the Connect operator is applied to it.