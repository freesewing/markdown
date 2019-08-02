---
title: Basic concepts
order: 200
---

This illustration is a good starting point to gain a better understanding of the main FreeSewing building blocks:

<Example part="docs_overview" caption="A schematic overview of FreeSewing" />

As you learn more about FreeSewing, you'll discover that there's more to this picture than meets the eye. So let's get started.

## What you'll learn

FreeSewing is written in JavaScript. It is in other words, *made for the web*.

There's no shortage of resources that delve into frontend development and JavaScript. So here, your focus will be on how FreeSewing patterns work, and how you can create them yourself.

If we look at our image, it can can divided into three areas:

<Example part="docs_overview" caption="Your focus today is on the middle part" options={{focus: "Pattern"}} />

- The left area with the *settings* box
- The middle area with the *Pattern* box and everything in it
- The right area with the *draft* box and the *SVG* and *React* logos

As there's a lot going on in the middle *Pattern* box. Rather than get overwhelmed by trying to wrap your head around the entire thing, you will start with the basic building blocks. Let's get started.

<Note>

The left and right parts are all about how to integrate FreeSewing in your *frontend*. In other words, how you'll plug it into your website, or online store, or a mobile application.

That part is outside the scope of this text. But if you'd like to learn more about front-end integration, start with FIXME: Insert link to relevant docs here.

</Note>

## Points

<Example part="docs_overview" caption="Points store coordinates" options={{focus: "Points"}} />

Developing a pattern with FreeSewing is similar to doing it on paper. But instead of using a pencil and paper, you'll be writing code.

Before we can draw any line, we need to know where it starts from, and where it ends. That's why we have [Points](/api/points). They are the most basic building block of a FreeSewing pattern, and their role is to store coordinates.

Each point must have:

- A X-coordinate
- A Y-coordinate

Together, they determine the points' location in the 2-dimensional plane we're drawing on.

<Note>

Points are unlikely to confuse you. The only gotcha is [the coordinate system](/concepts/coordinates) whic has a Y-axis that is inverted to what you may intuitively expect.

</Note>

<Tip>

Our example image (which, if you hadn't realized was created with FreeSewing) has a lot of points in it. The corners of the boxes, the location where the text goes, and so on. You can enable *design mode* to reveal all the points, and click on them to bring up their coordinates and other attributes.

</Tip>

See also:

- [The coordinate system](/concepts/coordinates)
- [The `Point` API](/api/point)

## Paths

<Example part="docs_overview" caption="Paths are the lines and curves of your pattern" options={{focus: "Paths"}} />

Paths are the lines and curves that make up your pattern.

They are made up of a set of drawing operations that together make up the path. FreeSewing supports the following types of drawing operations:

- The **move** operation moves our virtual pen but does not draw anything.
- The **line** operation draws a straight line
- The **curve** operation draws a [Bezier curve](/concepts/beziercurves) 
- The **close** operation closes the path

To crucial thing to keep in mind is that, with the exception of the **move** operation, all drawing operations start from wherever you are currently on your virtual sheet of paper.

For example, you might expect the **line** operation to take a start- and endpoint. But in fact, it only takes and endpoint, and will draw a straight line from *whereever we are* to that endpoint.

Because all but the **move** drawing operations are relative to their operation preceding it, **all Paths must start with a move operation**.

Understanding that each drawing operation builds upon the next one is an important insight.

<Tip>

Our example image (which, if you hadn't realized was created with FreeSewing) has a lot of paths in it. Each box, the arrows, the lines in the React logo, and so on.

You can enable *design mode* and click on a path to bring up its drawing operations and other attributes.

</Tip>

See also:

- [Bezier curves](/concepts/beziercurves)
- [The `Path` API](/api/path)

## Snippets

<Example part="docs_overview" caption="Snippets are little embelishments that go on your pattern" options={{focus: "Snippets"}} />

Snippets are little embellishments you can use and re-use on your pattern. They are typically used for things like logos or buttons.

Each snippet must have:

- An anchor point that determine where the snippet will be located
- The name of the snippet to insert

Since our example image does not have any snippets in it, here's another example of a `button`, `buttonhole`, and `logo` snippet added to a FreeSewing pattern:

<Example part="snippet" caption="An example of the use of snippets" />

See also:

- [The `Snippet` API](/api/snippet)
- [The `rendertest` pattern](/pakages/rendertest) pattern (which contains examples of all available snippets)

## Parts

<Example part="docs_overview" caption="Parts divide your pattern into re-usable components" options={{focus: "Part"}} />

Parts are a container for the points, paths, and snippets of (a part of) your pattern. They are also re-usable by other patterns, which makes them a powerful tool to build a pattern library.

For example, you may design a T-shirt pattern that has a `front`, `back`, and `sleeve` part. If you wanted to make a long-sleeved T-shirt pattern next, you could simply re-use the `front` and `back` parts of your T-shirt pattern, and simply design a new sleeve.

When you're developing a FreeSewing pattern, most of your time will be designing the individual parts.

See also:

- [The `Part` API](/api/part)

## Config

<Example part="docs_overview" caption="The pattern configuration holds important information about the pattern" options={{focus: "config"}} />

A pattern's [configuration](/config) is created by the pattern designer and details a number of important things about the pattern, like:

- The measurements that are required to draft the pattern
- The different parts in the pattern and how they depend on each other
- The different options that are available to tweak the pattern

See also:

- [Configuration](/config)

## Store

<Example part="docs_overview" caption="The store provides pattern-wide key/value storage" options={{focus: "store"}} />

The store provides key-value storage that is shared across your pattern.

If you have some information in one part that you want to make available outside that part (in another part) you can save it to the store.

See also:

- [The `Store` API](/api/part)

## Pattern

<Example part="docs_overview" caption="The pattern you create will be a constructor for instances of your pattern" options={{focus: "pattern"}} />

Last but not least, we've arrived at the level of the pattern itself. The pattern is a container that holds all your parts, along with the configuration and the store.

In reality, you're pattern will be a *constructor* that takes the user's settings as input and will return a new instance of your pattern.

That pattern instance will have a `draft()` method which will do the actual work of drafting the pattern. Once drafted, you can either call the `render()` method on the pattern instance, or pass it to [our React component](/packages/components) to render it in the browser.

See also:

- [The `Pattern` API](/api/part)