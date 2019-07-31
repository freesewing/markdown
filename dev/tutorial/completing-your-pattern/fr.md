---
title: Compléter votre patron
order: 260
---

Lorsque nous avons commencé, nous avons dit qu'une bonne partie standard ressemblait à cela :

```js
export default function(part) {
  let { Point, points, Path, paths } = part.shorthand();
  // Design pattern here

  // Complete?
  if (complete) {
    if (sa) {
    }
    // Paperless?
    if (paperless) {
    }
  }
  return part;
}
```

Jusqu'à présent, nous en sommes restés à la zone *// Design pattern here* (concevoir le patron ici), mais maintenant nous allons travailler sur la zone sous-jacente *// Complete?* (compléter ?)

<note>

###### L'intérêt des patrons (non) complétés

Les utilisateurs peuvent régler le réglage `complete` sur `false`. Lorsque c'est le cas, vous devriez ébaucher un contour de base du patron, plutôt qu'un patron totalement détaillé.

This has different uses, such as generating patterns to be cut out with a laser cutter.

</Note>

Le réglage `complete` est sur `true` par défaut, mais l'utilisateur peut le modifier. Pour accéder à ce paramètre, nous avons juste à dire à `part.shorthand()` que nous aimerions y avoir accès.

While we're at it, also add `snippets` and `Snippet`, like this:

```js
let {
  Point,
  points,
  Path,
  paths,
  measurements,
  options,
  macro,
  complete,
  snippets,
  Snippet
} = part.shorthand();
```

## Adding snippets

Snippets are little re-useable things to embellish your pattern with. Things like buttons or buttonholes, a logo, or snaps:

```js
// Complete?
if (complete) {
  snippets.snapMale = new Snippet("snap-male", points.snapLeft);
  snippets.snapFemale = new Snippet("snap-female", points.snapRight)
    .attr("opacity", 0.5);

  if (sa) {
  }
  // Paperless?
  if (paperless) {
  }
}
```

We've added a `snap-male` and `snap-female` snippet to the points we had foreseen for that.

Because the female snippet is at the back of the fabric, we've made it semi-transparent by setting the `opacity` attribute to `0.5`. Yes, you can do that.

<tip>

Any attributes you set will be added to the SVG output.

</Tip>

Since we're adding snippets, let's throw a logo on there to:

```js
points.logo = new Point(0, 0);
snippets.logo = new Snippet("logo", points.logo);
```

## Seam allowance

Just like users can choose whether they want a complete pattern or not, they can choose whether they want to include seam allowance on the pattern or not.

This is why we have this condition:

```js
if (sa) {
}
```

Our bib does not use seam allowance. Instead we'll finish it with bias tape. So you can simply remove that condition.

However, for future refefence, `sa` is a variable that you can get from `part.shorthand()` just like `complete`. But instead of `true` or `false` it will hold the amount if seam allowance in mm.

Note that you can still do `if (sa)` because zero is *falsy*.

We won't be adding seam allowance, but we will be doing something that is essentially the same. Rather than draw an outline outside our bib to indicate the seam allowance, we'll draw one within our bib to mark the bias tape:

```js
paths.bias = paths.seam
  .offset(-5)
  .attr("class", "various dashed")
  .attr("data-text", "finishWithBiasTape")
  .attr("data-text-class", "center fill-various");
```

The `path.offset()` method makes it trivial to add seam allowance, since it will contruct a path parallel at the distance you pass it. 9 times out of 10, you'll be using it as `path.offset(sa)`.

Note that we're also using the attributes again, to change the look of the line, and add text to it, as explained in [Adding text](/concepts/adding-text).

## Scalebox and title

Two more macros and we're done.

The `title` macro adds a title to our part. It's not that big a deal here since we only have one part in our pattern. But patterns typically have many different parts, some of them which might look rather similar. That's why you should number your parts and give them a name.

The `title` macro can help you with that:

```js
points.title = points.bottom.shift(-90, 45);
macro("title", {
  at: points.title,
  nr: 1,
  title: "bib"
});
```

The `scalebox` macro prints a box of an exact size. It is used by people who print the pattern to make sure their print is correctly scaled.

```js
points.scalebox = points.title.shift(-90, 55);
macro("scalebox", { at: points.scalebox });
```

And with that, our pattern is now *complete*:

<example pattern="tutorial" part="step11" caption="We used attributed to add color, dashes, text on a path and even opacity" />

We're not done yet though. There's one more thing the user can ask for: a *paperless* pattern.