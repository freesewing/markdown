---
title: Héritage de patron
---

Si votre patron est basé sur, ou étend un autre patron (certaines) parties de votre patron devront être ébauchées à partir du patron parent.

Dans ce cas, plutôt que de retourner notre propre méthode d'ébauche pour la partie, il est préférable d'instancier le patron parent, et de retourner sa méthode d'ébauche :

```js
import freesewing from "@freesewing/core";
import Brian from "@freesewing/brian";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";
// Parties
import draftBack from "./back";

// Créer un nouveau modèle
const Sorcha = new freesewing.Design(config, plugins);

// Attacher notre propre méthode d'ébauche au prototype
Sorcha.prototype.draftBack = part => draftBack(part);

// Attacher la méthode d'ébauche héritée au prototype
Sorcha.prototype.draftBase = function(part) {
  // Obtenir la partie base depuis Brian
  return new Brian(this.settings).draftBase(part);
};
```

<Warning>

Puisque nous utilisons le mot clé `this` (ça), vous ne pouvez pas utiliser la notation fléchée.

</Warning>

## Configuration

Les parties de patron héritées vont employer la configuration de votre patron. Vous devez vous assurer que votre patron possède toutes les options requises par le patron parent.

Par exemple, si vous héritez d'un patron qui a l'option `chestEase` (aisance de poitrine), vous devrez ajouter cette option à votre propre patron, car les parties héritées vont dépendre de cette option.

## Dépendances

Lorsque vous étendez un patron, vous devriez l'ajouter en tant que dépendance pair, plutôt que dépendance normale. Le faire évitera que le patron parent soit rassemblé avec votre propre patron.