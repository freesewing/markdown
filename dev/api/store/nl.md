---
title: "Store"
components: true
---

## Description

Het **Store** object houdt een plaats waar `key/value` paren bewaard kunnen worden, met methods voor het bewaren en terughalen van informatie.  
Een enkele `store` wordt gedeeld per patroon.

Een `store` wordt meestal gebruikt om informatie tussen delen van een patroon beschikbaar te kunnen maken. Bij voorbeeld de lengte van de halsopening in een patroondeel kan worden gebruikt om de lengte van de kraag in een ander deel te kunnen berekenen.

<Tip>

###### De `store` is beschikbaar als `shorthand`

Je kunt de `store` instance benaderen door de [Part.shorthand](./part#shorthand) methode;

```js
let { store } = part.shorthand();
```

</Tip>

## get()

```js
mixed store.get(string sleutel)
```

Geeft de waarde terug die onder `sleutel` opgeslagen is.

## set()

```js
void store.set(string sleutel, mixed waarde)
```

Slaat de waarde `waarde` op in de `store` onder de sleutel `sleutel`.

## setIfUnset()

```js
void store.setIfUnset(string sleutel, mixed waarde)
```

Slaat de waarde `waarde` op in de `store` onder de sleutel `sleutel`, maar alleen als die sleutel nog geen waarde heeft.