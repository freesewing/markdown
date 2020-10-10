---
title: Before you core
order: 10
for: developers
icons: 
  - start
  - pattern
about: |
  A guide to go over a few things you should know when you start working with our core library
goals:
  - Understand that FreeSewing provides parametric pattern design
  - Understand that FreeSewing uses SVG
  - Understand the coordinate system
  - Learn that we use millimeter internally
  - Learn about Bézier curves
---

Here's a few things that, once you get them, will make it easier to understand
what FreeSewing is doing, and how it's doing it. 

<Note>

##### There's no need to know everything

FreeSewing sits at the intersection of the world of makers and developers.
If your background is in development, you will need no explaining what SVG is, but might not
know much about designing sewing patterns. 
If on the other hand your background is in sewing or pattern design, you might wonder what
the heck Node JS is and why you should care.

Few people straddle both worlds, so as you start using FreeSewing, chances are 
you'll learn a few new things along the way. 

</Note>

## Parametric pattern design

The FreeSewing core library is a toolbox for *parametric pattern design*.

What that means is that FreeSewing is a somewhat *nerdy* way to design sewing patterns.
Patterns are implemented **as code**, which has a lot of advantages.

It allows for patterns that adapt to your measurements or preferences, 
fine-grained version control, seamless collaboration, and using one's work
as a starting point for you own, to name but a few.

That being said, you don't have to be a code monkey to use FreeSewing.

## SVG

Patterns are rendered as SVG — short
for [Scalable Vector Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) —
an XML-based vector image format and an open standard.

While you don’t need to be an SVG expert, a basic understanding of the format 
will greatly help you to understand FreeSewing.

For example, the coordinate system and the way paths
are structured are all related to the SVG drawing system, which is closely related
to other 2D drawing technologies such as PostScript or PDF.

##  Coordinate system

In FreeSewing, coordinates are like text in a book. 
You start at the top on the left side, and going to the right 
and downwards means going ahead.

<Example part="docs_coords" caption="The SVG coordinate system" /> 

Which means that on the X-axis, `20` is further to the right than `10`.  
Likewise, on the Y-axis, `50` is lower than `20`.

<Note>

The Y-axis is inverted in many drawing programs, with the origin
`(0,0)` being the lower left corner, rather than the upper left corner.

This is a common point of confusion so keep in mind that the Y-axis may
not behave as you would have intuitively expected.

</Note>

## Units

Internally, freesewing uses millimeter. 
When you write `1`, that’s one mm. When you write `7.8`, that’s 7.8mm.

While you can use cm or inch on the FreeSewing website, that is merely a layer of 
abstration on top of the internal units, which are always mm.

So as a pattern designer, you will work with mm.

## Bézier curves

While lines on computers are easy to store with a start and end point, 
curves require more information.

In FreeSewing — as in SVG and countless of other applications —  
curves are stored as Bézier curves. They have:

 - A start point
 - A first control point that’s linked to the start point
 - A second control point that’s linked to the end point
 - An end point

<Example settings={{complete: false}} part="path_curve" caption="An example of a Bézier curve drawn by the Path.curve() method" />

Bézier curves and their *handles* or *control points* are surprisingly intuitive. 
The following illustration does a great job at explaining how they are constructed:

![How Bézier curves are constructed](./bezier.gif)

<Note>

###### More on Bézier curves

Wikipedia has a good [introduction to Bézier curves](https://pomax.github.io/bezierinfo/).  
For a deep-dive into the subject, check out [A Primer on Bézier Curves](https://pomax.github.io/bezierinfo/) by Pomax.

Note that you don't need understand the mathematics behind Bézier Curves. 
As long as your intuitively *get* how the control points influence the curve, you're good to go.

</Note>

