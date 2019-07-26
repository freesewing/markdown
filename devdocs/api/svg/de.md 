---
title: Svg
path: /en/docs/developer/api/svg
components: true
---

## Description

The **svg** attribute of the [Pattern](/en/docs/developer/api/pattern) holds an object that represents an SVG document.

While the methods exposed by this object are typically only used internally, its attributes are useful for situations where you want to develop a plugin, or use a custom layout:

## svg.prefix

A string that will be rendered before the opening SVG tag.

Its default value is:

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
```

## svg.attributes

An [Attributes](/en/docs/developer/api/attributes) instance that controls the attributes of the SVG tag.

## svg.style

A string that will be rendered as the style section of the SVG document.

The style attribute is where plugins will add additional snippets.

```svg
<style type="text/css">
  /* svg.style will be inserted */
</style>
```

> ###### Add, but don't overwrite
> 
> When adding your own styles, it's important not to overwrite this property, but rather add your own.
> 
> In other words, do this:
> 
> ```js
svg.style += myStyles;
```

and don't do this:

```js
svg.style = myStyles;
```

## svg.script

A string that will be rendered as the script section of the SVG document.

We don't use this ourselves, but it's here if you need it.

```svg
<script type="text/javascript">
  /* svg.script will be inserted */
</scripts>
```

> ###### Add, but don't overwrite
> 
> When adding your own script, it's important not to overwrite this property, but rather add your own.
> 
> In other words, do this:
> 
> ```js
svg.script += myScript;
```

and don't do this:

```js
svg.script = myScript;
```

## svg.defs

A string that will be rendered as [the defs section](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/defs) of the SVG document.

The defs attribute is where plugins will add additional snippets.

```svg
<defs>
  /* svg.defs will be inserted */
</defs>
```

> ###### Add, but don't overwrite
> 
> When adding your own defs, it's important not to overwrite this property, but rather add your own.
> 
> In other words, do this:
> 
> ```js
svg.defs += myDefs;
```

and don't do this:

```js
svg.defs = myDefs;
```

## svg.head

A string that combines the [svg.style](#svgstyle), [svg.script](#svgscript), and [svg.defs](#svgdefs) sections and an opening tag for an SVG group.

```svg
<style type="text/css">
  /* svg.style will be inserted */
</style>

<script type="text/javascript">
  /* svg.script will be inserted */
</scripts>

<defs>
  /* svg.defs will be inserted */
</defs>

<!-- Start of group #fs-container -->
<g id="fs-container">
```

> ###### This does not include the opening SVG tag
> 
> Note that while [svg.tail](#svgtail) closes the SVG tag, [svg.head](#svghead) does not open it. That's because the `width`, `height` and `viewBox` attributes will depend on the main body of the SVG document.

## svg.tail

A string that closes both the group opened by [svg.head](#svghead) and the SVG tag.

```svg
</g>
<!-- end of group #fs-container -->
</svg>
```

## svg.layout

An object that holds rendered SVG for all parts, and a list of their transforms. It is structured as follows:

```js
{
  back: {
    svg: "( Holds rendered SVG for this part )",
    transforms: [ "translate(2, 2)" ]
  },
  // Other parts follow
}
```

## svg.pattern

A reference to [the Pattern object]("/en/docs/developer/api/pattern).

This allows hooks that only receive the SVG object (such as the preRender and postRender hooks) to still access the pattern object.