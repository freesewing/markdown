---
title: Using shorthand
order: 230
---

The [Part.shorthand()](/api/part/#shorthand) method will become your best friend.

By using [object destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Object_destructuring) you'll get access to a bunch of handy variables to make your code more concise and readable.

[Part.shorthand()](/api/#part-shorthand) provides a lot of things, and you typically don't need all of them, but here's everything it has to offer:

```js
  let {
    options,      // Pattern options
    measurements, // Model measurements
    Point,        // Point constructor
    Path,         // Path constructor
    Snippet,      // Snippet constructor
    points,       // Holds part points
    paths,        // Holds part paths
    snippets,     // Holds part snippets
    store,        // The store allows you to share data between parts
    utils,        // A collection of utilities
    macro,        // Method to call a macro
    debug,        // Method to log debug info
    sa,           // Requested seam allowance
    final,        // Whether to draft a complete pattern or not
    paperless,    // Whether to draft a paperless pattern or not
    units,        // Requested units
  } = part.shorthand();
```

<note>

Many examples throughout our documentation use [shorthand](#using-shorthand) notation.

</Note>