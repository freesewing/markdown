---
title: Afmetingen toevoegen
order: 130
---

Bij FreeSewing gaat het allemaal om *op maat gemaakte* naaipatronen; we ontwerpen patronen volgens de afmetingen die de gebruiker invoert.

De vraag is dus: welke afmetingen?

Jij, als patroonontwerper, bepaalt welke afmetingen nodig zijn om jouw patroon te ontwerpen. Voor ons slabbetje is de enige afmeting die we nodig hebben de hoofdomtrek of *head circumference* van de baby.

Dus voegen we die toe als vereiste afmeting.

## Vereiste afmetingen toevoegen

Open het config-bestand in `config/index.js` en update de `measurements`-reeks met de naam van de benodigde afmeting:

```js
measurements: ["headCircumference"],
```

<tip>

Let erop dat je de namen van bestaande afmetingen gebruikt in plaats van er zelf nieuwe te verzinnen.

Daarover lees je meer bij de [best practices](/do/names#re-use-measurements) over dit onderwerp.

</Tip>

Nu weet iedereen dat je patroon de afmeting `headCircumference` gebruikt.

Ook de developmentomgeving pikt deze verandering op. Je krijgt dus het volgende scherm te zien:

![Dit scherm laat je weten dat er vereiste afmetingen ontbreken](./required-measurements.png)

Aangezien het maar om één afmeting gaat, kunnen we eenvoudig handmatig een waarde invoegen. Bijvoorbeeld `38`, want 38 centimeter is een realistische hoofdomtrek voor een baby.

Voer `38` in in het kadertje en klik op **Ontwerp je patroon** bovenaan in de navigatie om terug te keren naar je ontwerp, dat er voorlopig nog zo uitziet:

<example pattern="tutorial" part="step1" caption="Nothing has changed, yet" />