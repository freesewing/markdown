---
title: Snippet
path: /en/docs/developer/api/snippet
components: true
---

## Description

A snippet is a reuseable bit of markup for your pattern. They are added to the
SVG `defs` section, and rendered with the SVG `use` tag.

The snippet constructor takes two arguments:

 - `def` : The `xlink:href` id that links to the relevant entry in the SVG `defs` section
 - `anchor` : A [Point](#point) on which to anchor the snippet

```js
Snippet new Snippet(def, Point);
```

A Snippet object comes with the following properties:

 - `def` : The `xlink:href` id that links to the relevant entry in the SVG `defs` section
 - `anchor` : A [Point](../point) on which to anchor the snippet
 - `attributes` : An [Attributes](../attributes) instance holding the snippet's attributes

In addition, a Snippet object exposes the following methods:

## Snippet.attr()

```js
Snippet snippet.attr(
  string name, 
  mixed value, 
  bool overwrite = false
)
```

This `Snippet.attr()` method calls [attributes.add](./attributes#add) under the hood, 
but returns the Snippet object.  This allows you to chain different calls together.

If the third parameter is set to `true` it will call [attributes.set](./attributes#set) instead, 
thereby overwriting the value of the attribute.

<api-example o="snippet" m="attr"></api-example>

## Snippet.clone()

```js
Snippet snippet.clone()
```

Returns a new Snippets object that is a deep copy of this one.

<api-example o="snippet" m="clone"></api-example>

