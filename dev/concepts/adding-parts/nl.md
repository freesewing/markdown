---
title: Patroondelen toevoegen
order: 210
---

Omdat alle patroondelen opgelijst staan in het [configuratiebestand](/en/docs/developer/config) weet FreeSewing precies welke delen er bij jouw patroon horen.

It expects that each pattern has it's own draft method, that is called `draft` followed by the capitalized name of the pattern part.

For example, if our pattern `Sorcha` has a part called `back`, you should have a `draftBack` method. It's good practice to keep each part in its own file, so create a file called `back.js`. Inside, you export your method to draft this part:

```js
export default part => {
  // Your part code here

  return part;
}
```

Then, in your `index.js` file, you import this file, and attach the method to your pattern's prototype:

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