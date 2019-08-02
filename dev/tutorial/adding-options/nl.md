---
title: Opties toevoegen
order: 140
---

Je weet hoe je slabbetje eruit moet zien, en je hebt de afmeting *headCircumference* (hoofdomtrek) om mee te werken. Maar je moet nog een aantal keuzes maken:

- Hoe groot moet de halsopening zijn?
- Hoe breed moet het slabbetje zijn?
- Hoe lang moet het slabbetje zijn?

Je kan al deze keuzes maken voor de gebruiker. Ze zijn dan 'in steen gebeiteld', om het zo maar te noemen.

Maar aangezien je een patroon aan het ontwerpen bent in code, is het een kleine moeite om je patroon flexibel te maken en de gebruiker te laten beslissen. Al wat je hoeft te doen, is opties toevoegen aan je patroon.

## De optie neckRatio toevoegen

De eerste optie die we gaan toevoegen bepaalt de verhouding tussen de halsopening en de hoofdomtrek. Laten we het `neckRatio` noemen.

Open het config-bestand in `config/index.js` en voeg dit toe bij de opties:

```js
  options: {
    // Verwijder deze maatoptie
    //size: { pct: 50, min: 10, max: 100 }
    // En voeg de opties neckRatio toe
    neckRatio: { pct: 80, min: 70, max: 90 }, 
  }
```

De betekenis hiervan kan je wel raden:

- We hebben type-percentage als optie toegevoegd
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