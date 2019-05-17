---
title: Building blocks
---
Creating a pattern with freesewing is similar to doing it on paper,
but rather than draw lines, we'll define them in code.

From the ground up, these are the main building blocks of a pattern:

 - [Points](#points)
 - [Paths](paths)
 - [Parts](parts)
 - [Pattern](pattern)

In addition, your pattern comes with the following *extras*:

 - [Snippets](snippets)
 - [Snippets](snippets)


## Points

Points mark a spot in a 2D plane through an X and Y coordinate.

If you think of a pattern as *connecting the dots*, those dots
are Points.

## Paths

Paths are the lines and curves that make up your pattern.

They are also literally made up of lines and 
curves, [Bezier curves](/concepts/beziercurves) to be specific.

## Snippets

Snippets are little embellishments you can use and re-use on your pattern.

They are typically used for things like logos or buttons. 

## Parts

Parts act as a container. They hold a specific set up Points, Paths
and other data that is relevant to a specific part of your pattern.

Imagine you're designing a more complex pattern, say a jacket.
Having all points and paths in one big pile would things different to manage.

Parts help you divide your pattern in discrete units that stand on their
own. A part typically represents a part of the garment, like the sleeve or collar.

## Pattern

The pattern is a container that holds all your parts, along with some other
information like the [configuration](/concepts/config) and [settings](/concepts/settings).

