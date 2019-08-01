---
title: Patroondelen toevoegen
order: 210
---

Omdat alle patroondelen opgelijst staan in het [configuratiebestand](/en/docs/developer/config) weet FreeSewing precies welke delen er bij jouw patroon horen.

Het gaat ervan uit dat elk patroon zijn eigen tekenmethode heeft met de naam `draft` gevolgd door de naam van het patroondeel met een hoofdletter.

Als ons patroon `Sorcha` bijvoorbeeld een onderdeel heeft dat `back` heet, dan heb je een methode `draftBack` nodig. Het is een goede werkwijze om elk deel in zijn eigen bestand te bewaren. In dit geval maak je dus een bestand met de naam `back.js`. Daarin exporteer je jouw methode om dit onderdeel te tekenen:

```js
export default part => {
  // De code voor jouw onderdeel

  return part;
}
```

Daarna importeer je dit bestand in je `index.js`-bestand en voegt de methode toe aan het prototype van je patroon:

```js
import freesewing from "freesewing";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";
// Parts
import draftBack from "./back";

// Create new design
const Sorcha = new freesewing.Design(config, plugins);

// Attach to pattern prototype
Sorcha.prototype.draftBack = part => draftBack(part);
```