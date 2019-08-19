---
title: Votre première partie
order: 120
---

Comme les vêtements eux-mêmes, les patrons sont composés de *parties*.

La plupart des patrons auront plusieurs parties. Une manche, une partie arrière, le col, etc. Notre patron est des plus simples, et ne comporte qu'une seule partie : le bavoir.

Le patron qui vient d'être créé pour nous a aussi une unique partie pour vous faire démarrer. Il est appelé **box** et il dessine une boîte. Si vous cliquez sur le bouton **Ébaucher votre patron** dans votre navigateur, vous allez la voir :

![The default pattern with its box part](./step1.png)

Puisque nous n'avons besoin que d'une seule partie, nous renommerons cette partie *box*, et l'appellerons *bib* (pour bavoir).

## Renommez la partie box en bib

Tout d'abord, mettez à jour le fichier de configuration dans `config/index.js`. Update the **parts** array with `bib`, rather than `box`:

```js
parts: ["bib"],
```

When that's done, rename the `src/box.js` file into `src/bib.js`.

Then, in the `src/index.js` file, change the import accordingly:

```js
// Change this line
//import draftBox from "./box";

// Into this
import draftBib from "./bib";
```

Finally, still in the `src/index.js` file, update the draftmethod:

```js
// Change this line
//Pattern.prototype.draftBox = draftBox;

// Into this
Pattern.prototype.draftBib = draftBib;
```

<tip>

###### Always use draftPartname

FreeSewing will expect for each part to find a method named Draft*Partname*.

If you have a part named `sleeve` you should have a method called `draftSleeve()` that drafts that part.

In our case, we have a part named `bib` so we're using `draftBib()` as the method that drafts it.

</Tip>

Congratulations, your pattern now has a `bib` part, rather than a `box` part. It still looks the same though:

<example pattern="tutorial" part="step1" caption="Our bib part, which is the renamed box part" />

This `bib` part is where we'll do some real work. But first, we have some more configuration to do.