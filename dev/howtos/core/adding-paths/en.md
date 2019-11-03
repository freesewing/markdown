---
title: Adding paths
order: 270
---

After using the [shorthand](/howtos/core/shorthand/) call, 
`Path` contains the path constructor, while `paths` is a reference to `part.paths`,
which is where you should store your paths.

Things will now *just work* when you do this:

```js
paths.example = new Path();
```

<Tip>

The [Path API docs](/api/path) list all the things you can do with a path object.

</Tip>
