---
title: Bezier curves
order: 150
---

While lines on computers are easy to store with a start and end point, curves require more information.

In FreeSewing — as in SVG and countless of other applications —  
curves are stored as Bezier curves. They have:

- A start point
- A first control point that’s linked to the start point
- A second control point that’s linked to the end point
- An end point

> Fixme: Insert curve render here with handles

Bezier curves and their *handles* are surprisingly intuitive, and the following illustration does a great job at explaining how they are constructed:

![How Bezier curves are constructed](./bezier.gif)