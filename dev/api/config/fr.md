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

### Constants

Si votre option est une valeur scalaire (comme une chaîne ou un nombre), elle sera traitée comme une constante :

```js
options: {
  collarFactor: 4.8
}
```

Plutôt que de définir des constantes dans votre code, c'est une bonne pratique de les définir dans votre fichier de configuration. De cette façon, les personnes qui étendent votre modèle peuvent les changer si elles le souhaitent.

### Booleans

Si votre option prend la valeur `true` (vraie) ou **false** (fausse), ou bien **activée** ou **désactivée**, ou encore **oui** ou **non**, vous pouvez utiliser un booléen :

Votre option booléenne devrait être un objet avec ces propriétés :

- `bool` : soit `true` (vrai) ou `false` (faux) qui sera la valeur par défaut

```js
options: {
  withLining: { bool: true }
}
```

### Percentages

Percentage options are the bread and butter of freesewing. Almost all your options will probably be percentages. They make sure that your pattern will scale regardless of size, and pass [the ant-man test](https://github.com/freesewing/antman).

Your percentage option should be an object with these properties:

- `pct` : The percentage
- `min` : The minimul that's allowed
- `max` : The maximum that's allowed

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

###### Percentage options will be divided by 100 when loaded

You specify percentages in your config file. For example, `50` means 50%. When your configuration is loaded, those percentages will by divided by 100.

So a percentage of `50` in your config file will be `0.5` when you read out that option in your pattern.

</Note>

### Millimeters

While we recommend using percentages where possible, sometimes that doesn't make sense.  
For those cases, you can use millimeters.

Your millimeter option should be an object with these properties:

- `mm` : The default value in millimeter
- `min` : The minimul that's allowed
- `max` : The maximum that's allowed

```js
options: {
  elasticWidth: { 
    mm:  35, 
    min:  5, 
    max: 80 
  }
}
```

### Degrees

For angles, use degrees.

Your degree option should be an object with these properties:

- `deg` : The default value in degrees
- `min` : The minimul that's allowed
- `max` : The maximum that's allowed

```js
options: {
  collarAngle: { 
    deg:  85, 
    min:  60 
    max: 130 
  }
}
```

### Counters

For a given number of things, use counters. Counters are for integers only. Things like number of buttons and so on.

Your counter option should be an object with these properties:

- `count` : The default integer value
- `min` : The minimal integer value that's allowed
- `max` : The maximum integer value that's allowed

```js
options: {
  butttons: { 
    count: 7, 
    min:   4,
    max:  12 
  }
}
```

### Lists

Use a list option when you want to offer an array of choices.

Your list option should be an object with these properties:

- `dflt` : The default for this option
- `list` : An array of available values options

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

Patterns also take these configuration options to facilitate frontend integration:

### design

The name of the designer:

```js
design: "Joost De Cock"
```

### code

The name of the developer:

```js
code: "Joost De Cock"
```

### type

Either `pattern` or `block`.

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