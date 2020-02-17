# Table of Contents  
- [1. Logging](#1-Logging)
- [2. TODOs](#2-todos)
- [3. Immutability](#3-immutability)
- [4. Derive Values](#4-derive-values)
- [5. Avoid Nesting](#5-avoid-nesting)
- [6. Single Purpose Files](#6-single-purpose-files)
- [10. No-ops](#10-no-ops)

# 1. Comments

- No file headers or author comments. We have source control for that.
- Comments should not state the obvious.
- Comments should state why we're doing something that seems strange.
- Docmenting method input, output is not considered stating the obvious.
- Prefer methods and variables over comments

# 2. TODOs
TODOs shouldn't be placed at all costs, instead done there an then if possible. <br>
If placed, it's best to place a ticket id alongside it. <br>
If placed & possible, raise as a project warning during builds. <br>

# 3. Immutability

Prefer using immutable data to mutable. <br>
Always declare local variables and properties as a immutable if not modified post initialization. <br>
Always use immutable collection interfaces (Collection, List) for collection return types of methods.

# 4. Derive Values

# 5. Avoid Nesting

# 6. Single Purpose Files

# 10. No-ops
Say no to no-ops
`x = x;`
