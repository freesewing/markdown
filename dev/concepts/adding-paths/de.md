---
title: Adding paths
order: 270
---

After using the [shorthand](/concepts/shorthand) call, `Path` contains the path constructor, while `paths` is a reference to `part.paths`, which is where you should store your paths.

Things will now *just work* when you do this:

```js
paths.example = new Path();
```

<tip>

The [Path API docs](/api/point) list all the things you can do with a path object.

</Tip>