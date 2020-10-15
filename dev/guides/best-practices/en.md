---
title: Pattern design best practices
order: 30
for: developers
icons: 
  - thumbup
  - pattern
about: "There's often many different ways to do things. Learn about our conventions and best practices"
goals:
 - Re-using measurement and options names
 - Re-using CSS classes
 - Respecting draft settings
 - Using percentage options where possible
 - Using translation keys for text
 - Constructing paths counter-clockwise
---

## Re-use measurements

When designing patterns, re-use the measurements that are already in use as much as possible.
Nobody wins when every pattern requires its own set of measurements, or names
certain measurements differently.

<Tip>

######  See our models packages for standard measurement names

The [@freesewing/models](/reference/packages/models/)
package contains all our standard measurement names.

</Tip>

## Re-use options

The same is (somewhat) true for options. While your pattern may require some very specific
options, there's probably a bunch that are similar to other patterns. Re-use those names.

As in, `bicepsEase` exists. So don't go creating an `upperArmEase` option.

## Re-use CSS classes

While you can style your pattern however you want, try to re-use the CSS class names that
are in use in our default [theme plugin](/reference/packages/plugin-theme/).

Doing so will ensure consistent styling for patterns.

## Respect draft settings

Apart from the pattern options that you configure for your pattern,
all FreeSewing patterns have a set of [draft settings](/reference/settings/) that can be tweaked
by the user.

While many of these will automatically be handled by FreeSewing, there are some
that you should take into account while developing your pattern. They are:

### Complete

The [complete](/reference/settings/#complete) setting is a boolean that is either true or false.
Its goal is to determine whether we should draft a *complete* pattern, or merely the outline.

### Paperless

The [paperless](/reference/settings/#paperless) setting is a boolean that is either true or false.

A *paperless* pattern is a pattern that has extra dimensions so users can trace the 
paper on fabric or paper without having the need to print it.

### Seam allowance

The [sa](/reference/settings/#sa) setting is a number that controls the seam allowance.

Unless `sa` is zero, you should add the requested seam allowance to your pattern.

### Example

To respect the `complete`, `paperless`, and `sa` draft settings, structure your parts as such:

```js
export default function(part) {
  let { complete, sa, paperless } = part.shorthand()
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

  return part
}
```

<Tip>

##### Use a multiple of `sa` for your hem allowance

Resist the temptation to use an absolute value for any seam allowance, including at the hem.

Always use a multiple of the `sa` value.

</Tip>

## Use percentage options where possible

When designing patterns, you should refrain from using absolute values.

That 6cm ease you add might be fine for all scenarios you tested, 
but then somebody comes around who is twice your size, or who is making clothes for a doll, 
and things will go off the rails.

Don't be tempted to add absolute values to your patterns, as they don't scale. 
Instead, embrace percentages as options.

<Tip>

##### Use the antman/antwoman tests

To check how well your pattern scales, you can 
use the *ant-man* test by sampling the pattern for 2 models:

 - A model with measurements of avarage person (the man)
 - A model with measurements 1/10th of an average person (the ant)

A well-designed pattern will scale a factor 10 down and hold its shape.
If your pattern makes assumptions about size, this test will show that.

FreeSewing's development environment provides these tests out of the box,
so you can see their results at the click of a button.

</Tip>

## Use translation keys, not text

Don't insert literal text in your patterns. Instead, insert a key that can then be translated.

For example, if you want to put *Finish with bias tape* on your pattern, don't be 
tempted to do this:

```js
path.seam.attr("data-text", "Finish with bias tape");
```

That (English) string is now hard-coded in your pattern. As freesewing supports 
translation out of the box, it would be a real shame not to make use of it.

Instead, insert a key to identify the string:

```js
path.seam.attr("data-text", "finishWithBiasTape");
```

This way, it can be translated.


## Construct paths counter-clockwise

Construct your paths counter-clockwise. You have to pick a direction anyway, and going
counter-clockwise is a bit of a convention.

This applies both to naming points (specifically the control points of curves)
and the order in which you define your points.

Obviously, the order in which you add points to your code needs to take a backseat
to the logic of your code. But typically what you're doing is constructing an outline
of (a part of) a garment.

So pick a point, and make your way around counter-clockwise. 

When naming control points for curves, re-use the name of the point they are attached to
and add `Cp1` to the control point before and `Cp2` to the control point after the point if
, once again, you'd follow your path counter-clockwise.


For example:

```js
part.paths.seam = new Path()
  .move(points.hemCenter)
  .line(points.hemSide)
  .line(points.waistSide)
  .curve(points.waistSideCp2, points.armholeCp1, points.armhole)
```

<Tip>

##### This convention helps with `Path.offset()` too

Constructing a path counter-clockwise will also ensure that the path offset goes outwards
rather than inwards.

</Tip>
