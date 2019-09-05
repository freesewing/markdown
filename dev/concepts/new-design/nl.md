---
title: Maken van een nieuw patroon
order: 200
---

Om een nieuw patroon te maken, roep de methode `new freesewing.Design()` aan. Het neemt de patroon configuratie, en plugins die je wilt laden als argumenten.

Bijvoorbeeld, voor het creëren van een nieuw patroon genaamd `Sorcha`:

```js
import freesewing from "@freesewing/core";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";

// Create new design
const Sorcha = new freesewing.Design(config, plugins);
```

Deze methode geeft geen `Design` object terug. In plaats daarvan geeft het een constructor methode voor je patroon.

Bij het importeren van je patroon is het zelf een constructor:

```js
import Sorcha from "@freesewing/sorcha";

// Sorcha is een contructor voor je patroon. 
let pattern = new Sorcha();
```

<Tip>

Constructors are functions you can call with `new` to create an object. As `freesewing.Design()` returns a constructor, you can think of it as a super-constructor.

</Tip>