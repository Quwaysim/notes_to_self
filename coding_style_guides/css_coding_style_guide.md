## Sass - Brand Colors

No colors should be defined outside of the `_colors.scss` file.

``` sass
// Bad
foo {
  color: #000;
}

// Good
foo {
  color: $black;
}
```

Preferably colors will be defined programmatically. When not possible, define colors with HEX values.

``` sass
// Good
$night: #1B2432;
$dim: mix($night, #fff, 70);

// Good
$dodger: #318AFB;
$denim: #1261C6;
```

### Sass - Opacity, Shading, & Mixing

Use built in SASS functions to access shades and varying levels of opacity for existing colors. Opacity (`transparentize`) and color `mix`'ing definitions should be limited to reasonable fractions or decimals no greater than *hundredths* in value. `darken`'ing or `lighten`'ing of colors should increment in intervals of *5%*.

``` sass
// GOOD
$sushi: darken($mantis, 10);
$zircon: mix($night, $white, 7.9);

foo {
  color: transparentize($radical, 0.3);
  background-color: darken($night, 5/8);
}

// BAD
bar {
  color: darken($dim, 11);
  background-color: transparentize($lilac, .3291)
}
```

## Sass - Formatting & Syntax

1. Omit the protocol `http:` and `https:` from resources unless required.
2. 2 space indentation for all file formats
3. Remove trailing white space
4. Lowercase all HTML Markup, SASS & CSS Selectors, Rules and Variables
5. Maintain strict separation of concerns
  - Markup: Structure and Semantics, avoid presentational tags and inline styles
  - Styling: Presentation and Animation
  - Behavior: Data Interaction
6. State: `TODO: Define how we want to align on defining state in CSS `

Write valid CSS whenever possible. Leave comments for invalid code that exists solely for the purpose of browser bugs. Code should regularly validated via http://jigsaw.w3.org/css-validator/

All default styles should target small screens, READ: Mobile First.

- Omit leading zeros `.8em`
- Omit units from 0 values `margin: 0;`
- Use 3 character hexadecimals when possible `#3ce`
- Use shorthand whenever possible
- Leave a space between rule and value
- Use single quotes
- Omit quotation marks from URIs
- Use only inline comments, which are omitted from compiled code

      // Inline comment

- If you must, prefix tasks with `TODO:`. These should rarely if ever reach production.

### Code Separation

- Place selectors and rules on separate lines
- Leave blank line between declarations

    selector {
      rule: value;
    }

    another {
      rule: value;
    }

### Media Queries

As often as possible place media queries within the selector they will modify.

      .site-nav {
        position: fixed;

        @media @large-devices {
          position: static;
        }
      }

## Sass - Naming Conventions

### BEM Reading

1. http://getbem.com/introduction/
2. https://medium.com/fed-or-dead/battling-bem-5-common-problems-and-how-to-avoid-them-5bbd23dee319

### Nesting

Though the need to nest rules should be resolved with BEM syntax, when it does occur it should be limited two levels deep.

### IDs

Don't use them.

### Class'

See above links about BEM Syntax. We use `underscore`'s in place of hyphens for separating modifier and element classes. `hyphens` for word separators.

Class strings should readable. Aim for clarity and simplicity.

Avoid type selectors `ul {}`
