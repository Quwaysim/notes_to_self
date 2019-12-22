## JavaScript - Variables

- define unchanging variables using `const`
- define variables that need to change using `let`
- when using require/import, order them by native, public, internal and space them the same

```javascript
// bad
const async = require('async');
const somethingPersonal = require('./something');
const request = require('request');

// bad
const path = require('path');
const async = require('async');
const request = require('request');
const somethingPersonal = require('./something');

// good
const path = require('path');

const async = require('async');
const request = require('request');

const somethingPersonal = require('./something');
```
- order variables alphabetically
- undefined variables should be on a single line

```javascript
// bad
let foo;
let bar;

// bad
let bar,
    baz,
    foo

// good
let bar, baz, foo;
```
- defined variables should be on their own line

```javascript
// bad
let bar = 'bar',
    baz = 'baz';

// good
let bar = 'bar';
let baz = 'baz';
```
- use destructuring whenever possible

```javascript
import Ember from 'ember';

const { $, computed } = Ember;
```

## JavaScript - Commas

- no dangling commas

```javascript
// bad
const foo = {
  bar: 'bar',
  baz: 'baz',
};

// good
const foo = {
  bar: 'bar',
  baz: 'baz'
};
```
- no leading commas

```javascript
// bad
const foo = {
  bar: 'bar'
  ,baz: 'baz'
};

// good
const foo = {
  bar: 'bar',
  baz: 'baz'
};
```

## JavaScript - Arrays

- define array using literal syntax

```javascript
// bad
const items = new Array();

// good
const items = [];
```
- use [Array#push](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) instead of assignment

```javascript
const foo = [];

// bad
foo[0] = 'bar';

// good
foo.push('bar');
```
- use the spread operator to copy arrays

```javascript
// bad
const len = items.length;
const itemsCopy = [];
let i;

for (i = 0; i < len; i++) {
  itemsCopy[i] = items[i];
}

// good
const itemsCopy = [...items];
```
- use [Array#from](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from) to copy an array like object

```javascript
function foo() {
  const args = Array.from(arguments);
}
```
- use return statements in array functions unless using a single statement (see *this rule*)

```javascript
// good
[1, 2, 3].map(x => {
  const y = x + 1;

  return y * x;
});

// good
[1, 2, 3].map(x => x + 1);
```
- use destructuring whenever possible

```javascript
const someArray = [1, 2, 3];
const [, two] = someArray;

console.log(two);
```

## JavaScript - Objects

- define objects using literal syntax

```javascript
// bad
const foo = new Object();

// good
const foo = {};
```
- use dot notation unless using a variable

```javascript
const foo = { bar: 'baz' };

// bad
console.log(foo['bar']);

// good
console.log(foo.bar);

// good
Object.keys(foo).forEach(prop => {
  console.log(foo[prop]);
});
```
- use object method shorthand

```javascript
// bad
const foo = {
  bar: function () {}
};

// good
const foo = {
  bar() {}
};
```
- use object property shorthand

```javascript
const someProp = 'some';

// bad
const foo = { someProp: someProp };

// good
const foo = { someProp };
```
- sort properties alphabetically
- only quote properties when required

```javascript
// bad
cont foo = {
  'bar': 'baz'
  'some-thing': 'something'
};

// good
const foo = {
  bar: 'baz',
  'some-thing': 'something'
};
```
- do not call Object prototype methods directly

```javascript
const foo = { bar: 'bar' };

// bad
foo.hasOwnProperty('bar');

// good
Object.prototype.hasOwnProperty.call(foo, 'bar');
```
- use destructuring whenever possible

```javascript
Import Ember from 'ember';

const { computed, get, set } = Ember;
```

## JavaScript - Strings

- strings must use single quotes
- strings longer than 100 should be wrapped

```javascript
// bad
const foo = 'This is a super long error that was thrown because of Batman. When you stop to think about how Batman had anything to do with this, you would get nowhere fast.';

// good
const foo = 'This is a super long error that was thrown because of Batman.' +
            'When you stop to think about how Batman had anything to do ' +
            'with this, you would get nowhere fast.';

```
- use template strings rather than concatenation

```javascript
const number = 12;

// bad
const foo = 'The number I'm thinking of is ' + number;

// good
const foo = `The number I'm thinking of is ${number}`;
```

## JavaScript - Functions

- use function declaration instead of expression

```javascript
// bad
const foo = function () {};

// good
function foo() {}
```
- wrap IIFE (immediately invoked function expressions) in parenthesis

```javascript
(function () {

}());
```
- never create functions inside non function (if, while, etc)

```javascript
// bad
if (true) {
  function foo() {
  }
}

// good
let foo

if (true) {
  foo = () => {

  };
}
```

- use default parameter syntax

```javascript
function foo(options = {}) {

}
```
- never use Function as a constructor

```javascript
// bad
const foo = new Function();

// bad
const foo = Function();
```
- add single space before and after parenthesis in unnamed functions

```javascript
// bad
function(){}

// bad
function() {}

// good
function () {}
```
- add single space after named function parenthesis

```javascript
// bad
function foo (){}

// bad
function foo(){}

// good
function foo() {}
```
- use the spread operator whenever possible

```javascript
const arr = [1, 2, 3, 4];

// bad
console.log.apply(arr);

// good
console.log(...arr);
```
- use arrow functions

```javascript
// bad
[1, 2, 3].map(function (item) {
  return item + 1;
});

// good
[1, 2, 3].map(item => {
  return item + 1;
});

// better
[1, 2, 3].map(item => item + 1);
```
- use implicit return whenever possible in arrow functions

```javascript
[1, 2, 3].map(item => item + 1);
```
- only wrap function arguments in parenthesis if there are more than one

```javascript
// bad
[1, 2, 3].map((item) => {
  return item + 1;
});

// good
[1, 2, 3].map(item => {
  return item + 1;
});

// good
[1, 2, 3].map((item, index, all) => {

});
```
- avoid confusing arrow functions and comparisons

```javascript
// bad
[1, 2, 3].map(item => item >= 1 ? item : item + 1);

// good
[1, 2, 3].map(item => {
  return item >= 1 ? item : item + 1;
});

// better
[1, 2, 3].map(item => {
  if (item >= 1) {
    return item;
  }

  return item + 1;
});
```

## JavaScript - Classes & Constructors

- always use class syntax

```javascript
class Foo {
}
```

- use extends for inheritance

```javascript
// bad
const inherits = require('inherits');

function Foo() {
}

inherits(Foo, Bar);

// good
class Foo extends Bar {
  constructor() {
    super();
  }
}
```
- omit useless constructor methods

```javascript
// bad
class Foo {
  constructor() {
  }
}

// good
class Foo {
}

// good
class Foo {
  constructor(name) {
    this.name = name;
  }
}
```

## JavaScript - Modules

- use ES6 module syntax

```javascript
// bad
const foo = require('foo');

// good
import foo from 'foo';
```
- Do not use wildcard imports

```javascript
// bad
import * as foo from 'foo';

// good
import foo from 'foo';
```
- do not export directly from an import

```javascript
// bad
export { bar as default } from 'foo';

// good
import { bar } from 'foo';

export default bar;
```
- define all imports from a single path in one place

```javascript
// bad
import { bar } from 'foo';
import { baz } from 'foo';

// good
import { bar, baz } from 'foo';
```
- never export mutable bindings

```javascript
// bad
let foo = 'bar';

export { foo };

// good
const foo = 'bar';

export { foo };
```
- modules with a single export should use default

```javascript
// bad
export function foo() {}

// good
export default function foo() {}
```
- all import statements should come before any other declarations

```javascript
// bad
import bar from 'bar';
bar.init();
import foo from 'foo';
foo.init();

// good
import bar from 'bar';
import foo from 'foo';
bar.init();
foo.init();

// better
import bar from 'bar';
import foo from 'foo';

bar.init();
foo.init();
```

## JavaScript - Comparison and equality

- use `===` and `!==` when comparing values
- use `=` when assigning values
- use shortcuts

```javascript
const arr = [1, 2, 3];
let foo;

// bad
if (arr.length === 0) {
}

if (foo === null) {
}

// good
if (!arr.length) {
}

if (!foo) {
}
```

## JavaScript - Blocks

- put else statements on the same line as the if brace

```javascript
// bad
if (foo) {

}
else {

}

// good
if (foo) {

} else {

}
```

## JavaScript - Comments

- use `/**...*/` for multi-line comments
- use `//` for single line comments
- inline comments should be avoided

```javascript
// bad
const foo = 'foo'; // no way!
```
- comments should come before their context

```javascript
// bad
function foo() {
// this function is awesome
}

// good
// this function is awesome
function foo() {
}
```
- use tags like FIXME, or TODO to denote actions required

```javascript
// TODO: this should be a constant
// FIXME: this isn't always a boolean
// HACK: this is a private method
```
- use FIXME for problems
- use TODO for solutions
- use HACK for things we know could be done better

## JavaScript - Whitespace

- two space, no tab

```javascript
// bad
••••const foo = 'foo';

// bad
•const foo = 'foo';

// good
••const foo = 'foo';
```
- single space after object properties

```javascript
// bad
const foo = {
  foo:'bar'
};

// good
const foo = {
  foo: 'bar'
};
```
- add single space before and after parenthesis in unnamed functions

```javascript
// bad
function(){}

// bad
function() {}

// good
function () {}
```
- add single space after named function parenthesis

```javascript
// bad
function foo (){}

// bad
function foo(){}

// good
function foo() {}
```

- single space before and after control statement parenthesis

```javascript
// bad
if(foo){}

// bad
if (foo){}

// good
if (foo) {}
```

- single space between all operators

```javascript
// bad
const foo = 1+1;

// good
const foo = 1 + 1;
```
- single space between arguments or array values

```javascript
// bad
function (foo,bar,baz) {
}

const arr = [1,2,3];

// good
function (foo, bar, baz) {

}

const arr = [1, 2, 3];
```
- newline at the end of the file
- use indenation with long method chains and use a leading dot

```javascript
// bad
foo().
  bar().
    baz().
  quz();

// good
foo()
.bar()
.baz()
.qux();
```
- space blocks by a single newline before and after

```javascript
// bad
const foo = 'foo';
if (foo) {
}
function bar() {}

// good
const foo = 'foo';

if (foo) {

}

function bar() {}
```
- single line after variable declarations

```javascript
// bad
const foo = 'foo';
console.log(foo);

// good
const foo = 'foo';

console.log(foo);
```
- no spaces in parenthesis

```javascript
// bad
function foo( bar, baz ) {}

// good
function foo(bar, baz) {}
```
- no spaces in brackets

```javascript
// bad
const arr = [ 1, 2, 3 ];

// good
const arr = [1, 2, 3];
```

- add single space inside braces

```javascript
// bad
const foo = {bar: 'bar'};

// good
const foo = { bar: 'bar' };
```

## JavaScript - Semicolons

- use them

## JavaScript - Type casting and Coercion

- use coercion at the beginning of the statement

```javascript
function (maybeNumber) {
  maybeNumber = Number(maybeNumber);
  maybeNumber++;
}
```

## JavaScript - Booleans

- do not use Boolean as a constructor

```javascript
const foo = 0;

// bad
const hasFoo = new Boolean(foo);

// bad
const hasFoo = Boolean(foo);

// good
const hasFoo = !!foo;

// best
const hasFoo = () => {
  return !!foo || foo === 'true';
};
```

## JavaScript - Naming conventions

- do not use single letter names

```javascript
// bad
function q() {}

// good
function query() {}
```
- names should be descriptive of their use
- use camelCase when naming variables, functions, objects, or instances

```javascript
// bad
const foo_bar = 'foobar';

// good
const fooBar = 'foobar';
```

- use PascalCase when naming constructors or classes

```javascript
// bad
function foo() {}

const foo = new foo();

// good
class Foo {
}

const foo = new Foo();
```
- use leading underscore when naming privates methods or variables

```javascript
// bad
class Foo {
  constructor() {
    this.private = 'private';
  }

  somethingPrivate() {
  }
}

// good
class Foo {
  constructor() {
    this._private = 'private';
  }

  _somethingPrivate() {
  }
}
```
- use arrow function rather than reassigning this

```javascript
// bad
const self = this;

[1, 2, 3].forEach(function (item) {
  self.items.push(item);
});

// good
[1, 2, 3].forEach(item => {
  this.items.push(item);
});
```

## JavaScript - Accessors

- avoid getters and setters

```javascript
// bad

class Foo {
  get bar() {
    return 'bar';
  }
}
```
- use methods for checking booleans

```javascript
class Foo {
  isFoo() {
    return !!this.foo;
  }
}
```
- using get/set is ok

```javascript
class Foo {
  get() {
    return this.foo;
  }

  set(value) {
    this.foo = value;
  }
}
```

## JavaScript - Events

- use namespaced events whenever possible

```javascript
// bad
$(window).on('scroll', event => {

});

$(window).off('scroll');

// good
$(window).on('scroll.scrollableElement', event => {

});

$(window).off('scroll.scrollableElement');
```
- ensure you always detach your event
- use hash over a single value when passing event data

```javascript
// bad
$(window).on('drop.draggable', (event, foo.id) => {
});

// good
$(window).on('drop.draggable', (event, foo) => {
});
```
