---
title: Partager des données entre des parties
---

Parfois, vous voudrez accéder aux données d'une partie dans une autre partie. Par exemple, vous pourriez stocker la longueur de l'emmanchure de vos parties devant et dos, puis lire cette valeur lorsque vous ébauchez la manche de façon à pouvoir vérifier que la manche s'ajuste bien à l'emmanchure.

Pour cela, vous devriez utiliser le [Store](/api/store) (Boutique), qui est disponible via l'appel au [shorthand](/concepts/shorthand) (raccourci) :

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

Dans un cas comme celui-là, l'ordre dans lequel les parties sont ébauchées devient important, alors vous devriez le signifier dans la [configuration du patron](/config).