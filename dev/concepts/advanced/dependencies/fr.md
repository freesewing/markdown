---
title: Dépendances des parties
---

Les dépendances des parties sont réglées dans la [configuration du patron](/config), et contrôle l'ordre dans lequel les parties sont dessinées. FreeSewing veillera à ébaucher toutes les dépendances d'une partie avant de l'ébaucher en elle-même.

Regardons un exemple :

```js
dependencies: {
  front: "base",
  back: "base",
  sleeve: ["front", "back"]
}
```

Cela pourrait provenir d'un patron de T-shirt où les patrons du `devant` et du `dos` sont très similaire, alors ils héritent tous deux d'une partie `base`. De plus, la partie `manche` doit être ebauchée après les parties `devant` et `dos` car nous stockons dans ces deux parties la longueur de la couture d'emmanchure dans la [boutique](/api/store) et nous avons besoin de cette information pour ajuster la tête de manche à l'emmanchure.

Maintenant, si un utilisateur émet la requête de n'ébaucher que la partie `manche`, FreeSewing va tout de même ébaucher :

- Tout d'abord la partie `base`
- Puis les parties `devant` et `dos`
- Et enfin la partie `manche`

mais elle va seulement rendre visuellement la partie `manche`, puisque c'est la seule chose demandée par l'utilisateur.

<note>

Pour hériter de parties, merci de vous référer à [Héritage de partie](/advanced/inject).

</Note>