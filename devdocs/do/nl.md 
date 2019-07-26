---
path: /en/docs/developer/do
title: Best practices
---

## Use meaningful names

Give your points, paths and snippets meaningful names. It makes it a lot easier for people to understand what's going on.

This is great:

```js
part.paths.seam = new Path()
  .move(points.hemCenter)
  .line(points.hemSide)
  .line(points.waistSide)
```

This is not:

```js
part.paths.s = new Path()
  .move(points.a)
  .line(points.b)
  .line(points.c)
```

This is awful:

```js
part.paths[part.getId()] = new Path()
  .move(new Point(12,23))
  .line(new Point(234,11))
  .line(new Point(0,12))
```

## Go counter-clockwise

Follow your paths counter-clockwise.

This applies both to naming points (specifically the control points of curves) and the order in which you define your points.

Obviously, the order in which you add points to your code needs to take a backseat to the logic of your code. But typically what you're doing is constructing an outline of (a part of) a garment.

So pick a point, and make your way around counter-clockwise.

When naming control points for curves, re-use the name of the point they are attached to and add `Cp1` to the control point before and `Cp2` to the control point after the point if , once again, you'd follow your path counter-clockwise.

For example:

```js
part.paths.seam = new Path()
  .move(points.hemCenter)
  .line(points.hemSide)
  .line(points.waistSide)
  .curve(points.waistSideCp2, points.armholeCp1, points.armhole)
```

## Use percentages as options

Don't be tempted to add absolute values to your patterns, as they don't scale. Instead, embrace percentages as options.

## Don't re-invent the wheel

###### Re-use measurements

When designing patterns, re-use the measurements that are already in use as much as possible. Nobody wins when every pattern requires its own set of measurements, or names certain measurements differently.

> ###### See our models packages for standard measurement names
> 
> The [freesewing models](https://github.com/freesewing/models) package contains all our standard measurement names.

###### Re-use options

The same is (somewhat) true for options. While your pattern may require some very specific options, there's probably a bunch that are similar to other patterns. Re-use those names.

As in, `bicepsEase` exists. So don't go creating an `upperArmEase` option.

###### Re-use CSS classes

While you can style your pattern however you want, try to re-use the CSS class names that are in use in our default [theme plugin](https://github.com/freesewing/plugin-theme).

Doing so will ensure consistent styling for patterns.

## Split up your code

Create a file per pattern part that you include. Rather than have all your code in one file.

## Use translation keys, rather than text

Don't insert literal text in your patterns. Instead, insert a key that can then be translated.

For example, if you want to put *Finish with bias tape* on your pattern, don't be tempted to do this:

```js
path.seam.attr("data-text", "Finish with bias tape");
```

That (English) string is now hard-coded in your pattern. As freesewing supports translation out of the box, it would be a real shame not to make use of it.

Instead, insert a key to identiy the string:

```js
path.seam.attr("data-text", "finishWithBiasTape");
```

## Use the ant-man test

When designing patterns, you should refrain from using absolute values.

That 6cm ease you add might be fine for all scenarios you tested, but then somebody comes around who is twice your size, or who is making clothes for a doll, and things will go off the rails.

To check how well your pattern scales, you can use [the ant-man test](https://github.com/freesewing/antman) by sampling the pattern for 2 models:

- A model with measurements of avarage person (the man)
- A model with measurements 1/10th of an average person (the ant)

A well-designed pattern will scale a factor 10 down and hold its shape. If your pattern makes assumptions about size, this test will show that.