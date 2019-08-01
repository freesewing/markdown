---
title: Configuration
---

Il s'agit du fichier de configuration du modèle. FreeSewing (la bibliothèque) n'a pas besoin de configuration. La configuration documentée ici concerne le fichier de configuration pour les patrons construits par dessus FreeSewing.

Pour la configuration d'exécution, voir les [Paramètres](/settings).

## name

```js
name: "sorcha"
```

Une chaîne de caractères correspondant au nom de votre patron.

## version

    version: "0.3.1"
    

## dependencies

```js
dependencies: {
  front: "back",
  sleeveplacket: ["sleeve", "cuff"]
}
```

Un objet de paires clé-valeur `key`-`value` qui contrôle l'ordre dans lequel les parties de patron vont être ébauchées.

<tip>

Voir les [Dépendances des parties](/advanced/dependencies) pour des informations plus poussées sur les dépendances.

</Tip>

## inject

```js
inject: {
  front: "back"
}
```

Un objet de pair clé-valeur `key`-`value` de parties. La partie valeur `value` sera injectée dans la partie clé `key`.

Par *injected* nous entendons plutôt que de commencer par une toute nouvelle partie, vous obtiendrez une partie qui a les points, chemins et snippets de la partie `value`.

<tip>

Voir l'[Héritage de partie](/advanced/inject) pour des informations plus poussées sur inject.

</Tip>

## hide

```js
hide: [
  "base"
]
```

Un tableau qui liste les parties de patron qui devraient être masquées par défaut. Hidden (caché) signifie qu'elles seront ébauchées, mais non rendues. Utilisé en général pour une partie de base sur laquelle d'autres parties sont construites.

## parts

```js
parts: [
  "front",
  "back"
]
```

Un tableau qui liste vos parties de patron (additionnelles). Le nom doit être la clé de l'objet `pattern.parts`.

<tip>

###### Cela n'a pas être une liste exhaustive de toutes les parties de votre modèle.

Cette liste de parties est nécessaire pour la méthode `draft()` pour déterminer quelles parties doivent être ébauchées. Donc, si des parties sont incluses dans la configuration `dependancies`, `inject`, ou `hide`, il n'est pas nécessaire de les inclure ici, comme nous avons déjà conscience de leur existence.

</Tip>

## measurements

```js
measurements: [
  "bicepsCircumference",
  "centerBackNeckToWaist"
]
```

Un tableau avec les noms des mesures nécessaires pour ébaucher ce modèle.

<note>

###### N'inventez pas simplement des noms

Voir les [modèles de patron freesewing](https://github.com/freesewing/models) pour une liste de noms de mesure déjà utilisés dans les patrons freesewing. Cela fait partie des [meilleures pratiques](/do/dont-re-invent-the-wheel) de garder ces noms.

</Note>

## options

Les options sont disponibles en 6 variétés :

- [Constants](#constants) (constantes) : Une valeur qui ne peut pas être modifiée
- [Booleans](#booleans) (booléens) : Une valeur qui est soit `true` (vraie) ou `false` (fausse)
- [Percentages](#percentages) (pourcentages) : Une valeur en pourcentage, avec des valeurs minimales et maximales
- [Millimeters](#millimeters) : Une valeur en millimètre, avec des valeurs minimales et maximales
- [Degrees](#degrees) (degrés) : Une valeur en degré, avec des valeurs minimales et maximales
- [Counters](#counters) (compteurs) : Une valeur entière, avec des valeurs minimales et maximales
- [Lists](#lists) (listes) : Une liste d'options avec un contenu par défaut

Sous le capot de la machine, les millimètres, les degrés et les compteurs sont gérés de la même manière. Nous utilisons des types différents parce qu'il est plus facile ainsi de comprendre la nature d'une option donnée.

### Constants (constantes)

Si votre option est une valeur scalaire (comme une chaîne ou un nombre), elle sera traitée comme une constante :

```js
options: {
  collarFactor: 4.8
}
```

Plutôt que de définir des constantes dans votre code, c'est une bonne pratique de les définir dans votre fichier de configuration. De cette façon, les personnes qui étendent votre modèle peuvent les changer si elles le souhaitent.

### Booleans (booléens)

Si votre option prend la valeur **true** (vraie) ou **false** (fausse), ou bien **activée** ou **désactivée**, ou encore **oui** ou **non**, vous pouvez utiliser un booléen :

Votre option booléenne devrait être un objet avec ces propriétés :

- `bool` : soit `true` (vrai) ou `false` (faux) qui sera la valeur par défaut

```js
options: {
  withLining: { bool: true }
}
```

### Percentages (pourcentages)

Les options de pourcentage sont le "gagne-pain" de freesewing. Presque toutes vos options seront probablement des pourcentages. Ils assurent que votre patron se mettra à l'échelle indépendamment de la taille, et passe avec succès [le test de l'homme-fourmi](https://github.com/freesewing/antman).

Votre option pourcentage devrait être un objet avec ces propriétés :

- `pct` : Le pourcentage
- `min` : Le minimum autorisé
- `max` : Le maximum autorisé

```js
options: {
  acrossBackFactor: { 
    pct:  97, 
    min:  93, 
    max: 100 
  }
}
```

<note>

###### Les options de pourcentage seront divisées par 100 lors du chargement

Vous spécifiez des pourcentages dans votre fichier de configuration. Par exemple, `50` signifie 50%. Lorsque votre configuration est chargée, ces pourcentages seront divisés par 100.

Donc un pourcentage de `50` dans votre fichier de configuration prendra la valeur `0.5` lorsque vous lisez cette option dans votre patron.

</Note>

### Millimeters (millimètres)

Bien que nous recommandons d'utiliser des pourcentages lorsque c'est possible, parfois cela n'a pas de sens.  
Pour ces cas précis, vous pouvez utiliser des millimètres.

Votre option booléenne devrait être un objet avec ces propriétés :

- `mm` : La valeur par défaut en millimètres
- `min` : Le minimum autorisé
- `max` : Le maximum autorisé

```js
options: {
  elasticWidth: { 
    mm:  35, 
    min:  5, 
    max: 80 
  }
}
```

### Degrees (degrés)

Pour les angles, utilisez des degrés.

Votre option degré devrait être un objet avec ces propriétés :

- `deg` : La valeur par défaut en degrés
- `min` : Le minimum autorisé
- `max` : Le maximum autorisé

```js
options: {
  collarAngle: { 
    deg:  85, 
    min:  60 
    max: 130 
  }
}
```

### Counters (compteurs)

Pour un nombre donné de choses, utilisez des compteurs. Les compteurs ne sont destinés qu'à des valeurs entières. Des choses comme le nombre de boutons, etc.

Votre option compteur devrait être un objet avec ces propriétés :

- `count` : La valeur entière par défaut
- `min` : La valeur entière minimale autorisée
- `max` : La valeur entière maximale autorisée

```js
options: {
  butttons: { 
    count: 7, 
    min:   4,
    max:  12 
  }
}
```

### Lists (listes)

Utilisez une option de liste lorsque vous souhaitez offrir un tableau de choix.

Votre option liste devrait être un objet avec ces propriétés :

- `dflt` : La valeur par défaut pour cette optional
- `list` : Un tableau d'options des valeurs disponibles

```js
options: {
  cuffStyle: { 
    dflt: "angledBarrelCuff",
    list: [
      "roundedBarrelCuff",
      "angledBarrelCuff"
      "straightBarrelCuff"
      "roundedFrenchCuff"
      "angledFrenchCuff"
      "straightFrenchCuff"
    ]
  }
}
```

## Extra

Les patrons prennent également ces options de configuration pour faciliter l'intégration frontend :

### design (conception)

Le nom du concepteur :

```js
design: "Joost De Cock"
```

### code

Le nom du développeur :

```js
code: "Joost De Cock"
```

### type

Soit `pattern` (patron), soit `block` (patron de base).

```js
type: "pattern"
```

### difficulty

A `1` to `5` difficulty score that indicates how hard it is to make the pattern:

```js
difficulty: 3
```

### tags

A set of tags to allow filtering of patterns on the website:

```js
tags: ["underwear", "top", "basics"],
```

### optionGroups

Organises your pattern options in groups. It expects an object where the key is the group title, and the value an array of options:

```js
optionGroups: {
  fit: ["chestEase", "hipsEase", "stretchFactor"],
  style: [
    "armholeDrop",
    "backlineBend",
    "necklineBend",
    "necklineDrop",
    "shoulderStrapWidth",
    "shoulderStrapPlacement",
    "lengthBonus"
  ]
} 
```