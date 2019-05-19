---
title: Respecting draft settings
---

Apart from the pattern options that you configure for your pattern,
all FreeSewing patterns have a set of [draft settings](/core/settings) that can be tweaked
by the user.

While many of these will automatically be handled by FreeSewing, there are some
that you should take into account while developing your pattern. They are:

###### Complete

The [complete](/core/settings/complete) setting is a boolean that is either true or false,
and its value is available via [the shorthand method](/concepts/shorthand).

Its goal is to determine whether we should draft a *complete* pattern, or merely the outline.

###### Paperless

The [paperless](/core/settings/paperless) setting is a boolean that is either true or false,
and its value is available via [the shorthand method](/concepts/shorthand).

A *paperless* pattern is a pattern that has extra dimensions so users can trace the 
paper on fabric or paper without having the need to print it.

###### Seam allowance

The [sa](/core/settings/paperless) setting is a number that controls the seam allowance,
and its value is available via [the shorthand method](/concepts/shorthand).

Unless `sa` is zero, you should add the requested seam allowance to your pattern.


To respect the `complete`, `paperless`, and `sa` draft settings, structure your parts as such:

```js
export default function(part) {
  let { complete, sa, paperless } = part.shorthand();
  
  // Your paths and points here

  if (complete) {
    // Your snippets, text, helplines and so on here
    
    if (sa) {
      // Your seam allowance here
    }

    if (paperless) {
      // Your dimensions
    }
  }

  return part;
}
```
