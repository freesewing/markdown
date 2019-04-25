---
title: Getting started
path: /en/docs/developer/start
---

Freesewing is a JavaScript library for made-to-measure sewing patterns.  
Or, more generally, it is a toolbox for parametric design of 2D drawings.

## Building blocks

Creating a pattern with freesewing is very much like doing it on paper. You need all the same tools, but now they are code.

You use freesewing to develop **patterns**. You'll end up exporting a [Pattern](/en/docs/developer/api/pattern) constructor method:

![Freesewing building blocks](./buildingblocks.svg)

A pattern comes with a [configuration](/en/docs/developer/config) and a [store](/en/docs/developer/api/store) and acts as a container for your pattern [parts](/en/docs/developer/api/part).

The main work is done in these **parts**. They hold the actual information, that make up your pattern. The [points](/en/docs/developer/api/point) that we need to draw the [paths](/en/docs/developer/api/path) and perhaps some [snippets](/en/docs/developer/api/snippet) too. They are reusable embelishments that you can add to your pattern. Like a notch, or a button, and so on.

In a typical scenario, your pattern will be instantiated with a bunch of user settings, after [drafting and rendering it](#draftvsrender), it will come out on the other end as SVG.

## Inheritance

Sewing patterns are rarely designed from scratch. A pattern is typically based on a block or sloper, or on another pattern. A western shirt pattern might be based on a button-down shirt pattern, which in turn is based on a menswear block, you get the idea.

In software, we call this *inheritance*. You may want to design your own pattern starting from nothing, but often, you can get started from something that's already halfway to where you want to go.

For example, Freesewing's Jaeger pattern is based on Bent, which in turn is based on Brian.

## Options

When we draw a pattern on paper, things are the way they are. When we code a pattern, we have the option to provide choices. Long sleeves? Short sleeves? Bit more ease in the waist, or fitted like a glove?

You can learn about all the types of options freesewing supports in the [configuration](/en/docs/developer/config) documentation.