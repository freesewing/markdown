---
title: Attributs
---

Les attributs correspondent à un objet qui contient les attributs pour une variété d'autres objets.

Les attributs sont liés aux objets [`Point`](/api/point), [`Path`](/api/path), et [`Snippet`](/api/snippet), et aussi à l'objet interne [`Svg`](/api/svg) .

Tous ceux-ci possèdent un objet Attributs instantié dans leur propriété `attributes`.

Un objet Attributes expose les méthodes suivantes :

## add()

```js
Attributes attributes.add(string key, string value)
```

Ajoute la valeur `value` à l'attribut identifié par la clé `key`.

Ajouter de multiples valeurs à la même clé résultera au fait qu'elles seront rassemblées ensemble (avec un espace) lors du rendu.

### Attributes.add() example

```js
let { Path, paths } = part.shorthand();

// Cela va rendre ainsi : class="classA classB"
paths.demo = new Path();
paths.demo.attributes.add('class', 'classA');
paths.demo.attributes.add('class', 'classB');

// Cela fait la même chose :
paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

// Cela a également le même résultat :
paths.demo = new Path()
  .attr('class', 'classA classB');
```

## clone()

```js
Attributes attributes.clone()
```

Retourne un nouvel objet Attributes qui est une copie profonde de celui-ci.

## get()

```js
string attributes.get(string key)
```

Renvoie la valeur de l'attribut stockée sous la clé `key`, ou la valeur `false` si elle n'est pas définie.

Si la clé a plusieurs valeurs, elles seront réunies dans une chaîne, séparées par des espaces.

### Attributes.get() example

```js
let { Path, paths } = part.shorthand();

paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

let class = paths.demo.attributes.get('class'); 
// class contient maintenant : "classA classB"
```

## getAsArray()

```js
array attributes.getAsArray(string key)
```

Retournera un tableau avec la valeur de l'attribut stockée sous la clé `key`, ou la valeur `false` si elle n'est pas définie.

### Attributes.getAsArray() example

```js
let { Path, paths } = part.shorthand();

paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

let class = paths.demo.attributes.getAsArray('class'); 
// class contient maintenant : ["classA", "classB"]
```

## remove()

```js
Attributes attributes.remove(string key)
```

Supprime les valeurs des attributs sous la clé et retourne l'objet Attributes.

### Attributes.remove() example

```js
let { Path, paths } = part.shorthand();

paths.demo = new Path()
  .attr('class', 'classA')
  .attr('class', 'classB');

let class = paths.example.attributes
  .remove()
  .get('class'); 
// class contient maintenant : false
```

## set()

```js
Attributes attributes.set(string key, string value)
```

Définit l'attribut identifié par la clé `key` par la valeur `value`.

<warning>

Ceci écrasera toute valeur actuellement définie sur l'attribut identifié par la clé `key`.

</Warning>

### Attributes.set() example

```js
let { Path, paths } = part.shorthand();

// Cela va rendre ainsi : class="classB"
paths.demo = new Path();
paths.demo.attributes.set('class', 'classA');
paths.demo.attributes.set('class', 'classB');

// Cela fait la même chose :
paths.demo = new Path()
  .attr('class', 'classA', true)
  .attr('class', 'classB', true);
```