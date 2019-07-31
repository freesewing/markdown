---
title: Ajouter des options
order: 140
---

Vous savez à quoi devrait ressembler votre bavoir, et vous disposez de la mesure *headCircumference* (pour tour de tête en français). Mais il y a encore un certain nombre de choix que vous allez devoir faire :

- Quelle devrait être la largeur de l'encolure ?
- Quelle sera la largeur du bavoir ?
- Quelle longueur devra-t-il avoir ?

Vous pourriez faire ces choix à la place de l'utilisateur et les graver dans la pierre, pour ainsi dire.

Mais étant donné que vous concevez un patron sous forme de code, il est trivial de rendre votre patron flexible et de laisser le choix à l'utilisateur. Tout ce que vous avez à faire est d'ajouter des options à votre patron.

## Ajouter l'option neckRatio

La première option que nous allons ajouter contrôle le ratio entre l'encolure et le tour de tête. Appelons-la `neckRatio`.

Open the config file at `config/index.js` and add this to the options:

```js
  options: {
    // Remove this size option
    //size: { pct: 50, min: 10, max: 100 }
    // And add the neckRatio options
    neckRatio: { pct: 80, min: 70, max: 90 }, 
  }
```

Can you guess what it means?

- We've added a option of type percentage
- Its minimum value is 70%
- Its maximum value is 90%
- Its default value is 80%

<note>

There are different types of options, but percentages are the most common ones. They are all documentation [in the API docs](/api/config#options).

</Note>

Let's do something similar for the width and length of our bib:

```js
options: {
  neckRatio: { pct: 80, min: 70, max: 90 }, 
  widthRatio: { pct: 45, min: 35, max: 55 }, 
  lengthRatio: { pct: 50, min: 40, max: 65 }, 
}
```

- You've added `widthRatio` and `lengthRatio` options
- You've given all options sensible defauls 
- You've given all options sensible maximum and minimum boundaries

<note>

Later, you'll test-drive your pattern to see how it behaves when you adapt the options between their minimum and maximum values. At that time, you can still tweak these values.

</Note>

Before you close the `config/index.js` file, make sure to update the `optionGroups` entry as follows:

```js
optionGroups: {
  fit: ["neckRatio", "widthRatio", "lengthRatio"]
},
```

<note>

The `optionGroups` entry does not do anything for your pattern as such. Instead it signals to the frontend that this is how options should be grouped together and presented to the user.

</Note>

Because you have removed the `box` option, the pattern no longer draws a box. So let's start drawing your bib instead.