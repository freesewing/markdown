---
title: Référence API
path: /fr/docs/developer/api
components: true
---

Freesewing exporte un objet unique avec les propriétés suivantes :

## freesewing.version

```js
string freesewing.version
```

Une chaîne de caractères (string) contenant le numéro de version de freesewing.

## freesewing.create()

```js
function freesewing.create(object config, object|array plugins)
```

Utilisez cette méthode pour créer vos propres patrons. Elle prend les arguments suivants :

 - `config` : La configuration du patron
 - `plugins` : Soit un objet de type plugin, soit une matrice d'objets de type plugin
à charger dans votre patron

Cette méthode vous retournera une méthode de construction qui devrait être appelée pour 
instancier votre patron. 
Voir [Créer un nouveau patron](/fr/docs/developer/examples/#creating-a-new-pattern).

## Utilitaires

Une collection d'utilitaires. Voir [Utilitaires](./api/utils).

## freesewing.patterns

Lorsque vous lancez la construction du navigateur de freesewing, 
les patrons chargés vont se rattacher ici.

> Ceci n'est pertinent que si vous lancez freesewing directement dans le navigateur, 
plutôt que d'utiliser a version noeud et un paqueteur.

## freesewing.plugins

Lorsque vous lancez la construction du navigateur de freesewing, 
les plugins chargés vont se rattacher ici.

> Ceci n'est pertinent que si vous lancez freesewing directement dans le navigateur, 
plutôt que d'utiliser a version noeud et un paqueteur.

## freesewing.Pattern()

Le constructeur de [Patron](./api/pattern). 

> ###### Obsolète
>
> L'usage de ce constructeur est obsolète, et il sera supprimé de 
> l'export par défaut de la nouvelle version.

## freesewing.Point()

Le constructeur de [Point](./api/point).

> ###### Obsolète
>
> L'usage de ce constructeur est obsolète, et il sera supprimé de 
> l'export par défaut de la nouvelle version.

## freesewing.Path()

Le constructeur de [Chemin](./api/path).
> ###### Obsolète
>
> L'usage de ce constructeur est obsolète, et il sera supprimé de 
> l'export par défaut de la nouvelle version.

## freesewing.Snippet()

Le constructeur de [Fragment](./api/snippet).

> ###### Obsolète
>
> L'usage de ce constructeur est obsolète, et il sera supprimé de 
> l'export par défaut de la nouvelle version.
