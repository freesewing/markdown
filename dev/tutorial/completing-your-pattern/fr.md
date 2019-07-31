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

Tant que nous y sommes, ajoutons également `snippets` et `Snippet`, comme ceci :

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

Les snippets sont de petites choses réutilisables pour embellir notre patron. Des choses comme les boutons et les boutonnières, un logo, ou des boutons pression :

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

Nous avons ajouté des snippets `snap-male` (pression mâle) et `snap-female` (pression femelle) aux points que nous avons envisagés pour cela.

Etant donné que la pression femelle est sur l'envers du tissu, nous l'avons rendue semi-transparente en réglant l'attribut `opacity` (opacité) à `0.5`. Oui, vous pouvez faire ça.

<tip>

Tous les attributs que vous réglez seront ajoutés à la sortie SVG.

</Tip>

Puisque nous ajoutons des snippets, mettons-y également un logo :

```js
points.logo = new Point(0, 0);
snippets.logo = new Snippet("logo", points.logo);
```

## Seam allowance

De la même façon que les utilisateurs peuvent choisir s'ils désirent un patron complet ou non, ils peuvent choisir d'inclure ou non des marges de couture sur le patron.

Voici pourquoi nous avons cette condition :

```js
if (sa) {
}
```

Notre bavoir n'utilise pas de marge de couture. Nous allons employer du biais pour la finition. Alors vous pouvez simplement supprimer cette condition.

Toutefois, pour de futures références, `sa` (pour seam allowance) est la variable que vous pouvez obtenir de `part.shorthand()` tout comme `complete`. But instead of `true` or `false` it will hold the amount if seam allowance in mm.

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