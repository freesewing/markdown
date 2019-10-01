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

The `front` and `back` parts will be *injected* with the `base` part. Ainsi, les parties `devant` et `dos` seront instanciées parts avec une copie clonée de tous les points, chemins et les snippets de la partie `base`.

C'est un patron de conception standard où une partie se construit sur une autre. Dans notre exemple, nous pouvons imaginer un patron de T-shirt où le devant et le dos sont assez similaires, en dehors de l'encolure. Alors plutôt que de nous répéter, nous ébauchons une partie `base` et injectons cela dans les parties `devant` et `dos`.

Utiliser `inject` va faire que FreeSewing ébauchera toujours la partie injectée avant d'ébaucher la partie dans laquelle elle est injectée. Cela va, en d'autres termes, influencer l'ordre d'ébauche.

<Note>

For inheriting parts from other patterns, please refer to [pattern inheritance](/advanced/inheritance).

</Note>

