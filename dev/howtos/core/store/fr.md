---
title: Partager des données entre des parties
---

Parfois, vous voudrez accéder aux données d'une partie dans une autre partie. Par exemple, vous pourriez stocker la longueur de l'emmanchure de vos parties devant et dos, puis lire cette valeur lorsque vous ébauchez la manche de façon à pouvoir vérifier que la manche s'ajuste bien à l'emmanchure.

For this, you should use the [Store](/reference/api/store/), which is available via the [shorthand](/howtos/core/shorthand/) call:

```js
export default function(part) {
  let { store } = part.shorthand();
  store.set('hello', 'world');

  return part();
}
```

```js
export default function(part) {
  let { store } = part.shorthand();
  store.get('hello'); // Returns 'world'

  return part();
}
```

In a case like this, the order in which parts are drafted becomes important, so you should reflect that in the [pattern configuration](/reference/config/).
