---
title: Héritage de partie
---

L'héritage de partie au sein de votre propre patron est géré via les paramètres `inject` dans la [configuration du patron](/config). Voici un exemple simple :

```js
inject: {
  front: "base",
  back: "base",

}
```

Les parties `devant` et `dos` vont être *injectées* dans la partie `base`. Ainsi, les parties `devant` et `dos` seront instanciées parts avec une copie clonée de tous les points, chemins et les snippets de la partie `base`.

C'est un patron de conception standard où une partie se construit sur une autre. Dans notre exemple, nous pouvons imaginer un patron de T-shirt où le devant et le dos sont assez similaires, en dehors de l'encolure. Alors plutôt que de nous répéter, nous ébauchons une partie `base` et injectons cela dans les parties `devant` et `dos`.

Utiliser `inject` va faire que FreeSewing ébauchera toujours la partie injectée avant d'ébaucher la partie dans laquelle elle est injectée. Cela va, en d'autres termes, influencer l'ordre d'ébauche.

<Note>

Pour hériter des parties d'autres patrons, merci de vous référer à [l'héritage de patron](/advanced/inheritance).

</Note>