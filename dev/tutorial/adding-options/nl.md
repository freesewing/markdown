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
- De minimumwaarde is 70 %
- De maximumwaarde is 90 %
- De standaardwaarde is 80 %

<note>

Er zijn verschillende types van opties, maar percentages zijn de meest voorkomende. Ze zijn allemaal gedocumenteerd [in de API-documenten](/api/config#options).

</Note>

Laten we iets vergelijkbaars doen voor de breedte en lengte van het slabbetje:

```js
options: {
  neckRatio: { pct: 80, min: 70, max: 90 }, 
  widthRatio: { pct: 45, min: 35, max: 55 }, 
  lengthRatio: { pct: 50, min: 40, max: 65 }, 
}
```

- Je hebt nu de opties `widthRatio` en `lengthRatio` toegevoegd
- Je hebt voor alle opties realistische standaardwaardes ingesteld 
- Je hebt voor alle opties realistische maximum- en minimumgrenzen ingesteld

<note>

Op een later moment ga je het patroon testen om te zien hoe het zich gedraagt wanneer je de opties aanpast tussen de minimum- en maximumwaardes. Op dat moment kan je de waarden nog altijd aanpassen.

</Note>

Let erop voordat je het `config/index.js`-bestand sluit, dat je de `optionGroups`-entry als volgt updatet:

```js
optionGroups: {
  fit: ["neckRatio", "widthRatio", "lengthRatio"]
},
```

<note>

De `optionGroups`-entry heeft op zich geen enkele invloed op je patroon. Het geeft enkel aan de frontend aan dat opties op deze manier bij elkaar moeten worden gezet en aan de gebruiker worden getoond.

</Note>

Omdat je de `box`-optie hebt verwijderd, tekent het patroon nu geen kader meer. Laten we dus beginnen met je slabbetje te tekenen.