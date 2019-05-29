---
path: /fr/docs/developer/config
title: Configuration
---

Cet article concerne le fichier de configuration des patrons.
Freesewing (la librairie) ne requiert pas de configuration. 
La configuration documentée ici est le fichier de configuration pour
les patrons qui sont construits par dessus freesewing.

Pour la configuration d'exécution, allez voir les [réglages](/fr/docs/developer/settings/).

## name

```js
name: "sorcha"
```

Une chaîne de caractère avec le nom de votre patron.

## version

```
version: "0.3.1"
```

Une chaîne de caractère avec la version de votre patron.

> ###### Ne le réglez pas manuellement
>
> Avoir à régler manuellement la version de votre fichier de configuration va vous mener droit vers l'erreur. 
> Au lieu de cela, chargez le numéro de version depuis votre fichier `package.json`.
> 
> Notre [Modèle de patron](https://github.com/freesewing/pattern-template/blob/master/config/config.js)
> utilise également cette approche.

## dependencies

```js
dependencies: {
  front: "back",
  sleeveplacket: ["sleeve", "cuff"]
}
```

Un objet de paires `clé`-`valeur` qui contrôle l'ordre dans lequel vos parties de patron vont être ébauchées.

La `clé` doit être un nom de partie, la `valeur` peut être une chaîne de caractère contenant une nom de partie, 
ou un tableau de chaînes de caractères contenant plusieurs noms de partie.

Ceci sera utilisé pour déterminer l'ordre d'ébauche, et si, en premier lieu, une partie sera ébauchée ou non.

Dans l'exemple ci-dessus, si l'utilisateur demande la partie `front` (devant), nous allons tout de même
ébaucher la partie `back` (dos) étant donné que c'est une dépendance.

## inject

```js
inject: {
  front: "back"
}
```

Un objet de paires `clé`-`valeur` des parties. La partie `valeur` sera injectée dans la partie `clé`.

L'*injection* signifie que plutôt que de démarrer avec une nouvelle partie, vous allez obtenir une partie qui 
a des points, chemins et fragments d'une partie `valeur`.

> ###### dependencies vs inject
>
> Employez une dépendance lorsqu'une partie dépend d'une autre. Par exemple, vos manches dépendent de 
> la longueur de l'emmanchure que vous avez stockée dans le store.
> 
> Utilisez inject si votre partie se construit au dessus d'une autre. Par exemple, For example, le devant est  
> simplement la partie dos avec quelques mises au point.

## hide

```js
hide: [
  "base"
]
```

Un tableau qui liste les parties de patron qui devraient être cachées par défaut.
Caché veut dire qu'ils seront ébauchés mais non rendu. C'est généralement utilisé 
pour une partie de base sur laquelle les autres parties sont construites.

## parts

```js
parts: [
  "front",
  "back"
]
```

Un tableau qui liste vos parties (additionnelles) de patron. Le nom doit être la clé de l'objet `pattern.parts`.

> ###### Cela n'a pas à être une liste exhaustive de toutes les parties de votre patron.
>
> Cette liste de parties est nécessaire pour la méthode `draft()` pour trouver quelles 
> parties doivent être ébauchées.
> Alors si des parties sont incluses dans la configuration de `dependencies`, `inject`, ou `hide`, 
> il n'y a nul besoin de les inclure ici, puisque leur existence est déjà connue.


## measurements

```js
measurements: [
  "bicepsCircumference",
  "centerBackNeckToWaist"
]
```
Un tableau avec les noms des mesures requises pour ébaucher le patron. 

> ###### Ne fabriquez pas de noms.
>
> Faites un tour sur les [modèles freesewing](https://github.com/freesewing/models) 
> pour une liste des noms de mesures qui sont déjà utilisés dans les patrons freesewing.
> Cela fait partie des [Meilleures pratiques](/fr/docs/developer/do#dont-re-invent-the-wheel) de se conformer à ces notations.

## options

Les options se divisent en 6 catégories :

 - [Constantes](#constantes) : Une valeur qui ne peut être changée
 - [Pourcentages](#pourcentages) : Une valeur en pourcentage, avec une valeur minimale et une valeur maximale
 - [Millimètres](#millimètres) : Une valeur en millimètres, avec une valeur minimale et une valeur maximale
 - [Degrés](#degrés) : Une valeur en degrés, avec une valeur minimale et une valeur maximale
 - [Compteurs](#compteurs) : Une valeur entière, avec une valeur minimale et une valeur maximale
 - [Listes](#listes) : Une liste d'option avec une valeur par défaut

Sous le capot, les millimètres, degrés, et compteurs sont traités de la même manière. 
Nous utilisons des types différents pour que la nature d'une option donnée soit plus compréhensible.


### Constantes

If your option is a scalar value (like a string or a number), it will be treated as a constant:

```js
options: {
  collarFactor: 4.8
}
```

Plutôt que de définir des constantes dans votre code, c'est une meilleure pratique de les régler dans votre fichier de configuration.
De cette façon, les personnes qui étendent votre patron peuvent les modifier si elles le désirent.

### Pourcentages

Les options poucentages sont le fondement de freesewing.
Presque toutes nos options seront probablement des pourcentages.
Ils assurent le fait que votre patron aura la bonne échelle peu importe la taille,
et passera [le test de l'homme fourmi](https://github.com/freesewing/antman).

Votre option pourcentage devrait être un objet avec ces propriétés :

 - `pct` : le pourcentage
 - `min` : le minimum autorisé
 - `max` : le maximum autorisé

```js
options: {
  acrossBackFactor: { 
    pct:  97, 
    min:  93, 
    max: 100 
  }
}
```

> ###### Les options pourcentage seront diviséees par 100 au chargement
>
> Vous spécifiez des pourcentages dans votre fichier de configuration. Par exemple, `50` signifie 50%.
> Lorsque votre configuration sera chargée, ces pourcentages seront divisés par 100. 
> 
> Alors un pourcentage de `50` dans votre fichier config sera `0.5` lorsque vous lirez cette option dans votre patron.

### Millimètres

Bien que nous recommandions l'usage de pourcentages lorsque c'est possible, parfois cela n'a aucun sens.  
Dans ces cas-là, vous pouvez utiliser les millimètres.

Votre option millimètre devrait être un objet avec ces propriétés :

 - `mm` : la valeur par défaut en millimètres
 - `min` : le minimum autorisé
 - `max` : le maximum autorisé

```js
options: {
  elasticWidth: { 
    mm:  35, 
    min:  5, 
    max: 80 
  }
}
```

### Degrés

Pour les angles, utiliser les degrés.

Votre option degré devrait être un objet avec ces propriétés :

 - `deg` : la valeur par défaut en degrés
 - `min` : le minimum autorisé
 - `max` : le maximum autorisé

```js
options: {
  collarAngle: { 
    deg:  85, 
    min:  60 
    max: 130 
  }
}
```

### Compteurs

Pour un nombre donné de choses, utilisez les compteurs.
Les compteurs sont seulement pour les données de valeurs entières. Des choses comme le nombre de boutons par exemple.

Votre option compteur devrait être un objet avec ces propriétés :

 - `count` : la valeur entière par défaut
 - `min` : le minimum autorisé
 - `max` : le maximum autorisé

```js
options: {
  butttons: { 
    count: 7, 
    min:   4,
    max:  12 
  }
}
```

### Listes

Employez une option liste lorsque vous voulez proposer un tableau de choix.

Votre option de liste devrait être un objet avec ces propriétés :

 - `dflt` : le défaut pour cette option
 - `list` : un tableau de valeurs disponibles pour l'option

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
