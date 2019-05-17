---
path: /fr/docs/developer/do
title: Meilleures pratiques
---

## Utiliser des noms qui ont du sens

Donner des noms qui ont du sens à vos points, chemins et fragments. 
Cela facilite grandement la tâche aux gens pour comprendre ce qu'il se passe.

Ce code est génial :

```js
part.paths.seam = new Path()
  .move(points.hemCenter)
  .line(points.hemSide)
  .line(points.waistSide)
```
Celui-là ne l'est pas :
```js
part.paths.s = new Path()
  .move(points.a)
  .line(points.b)
  .line(points.c)
```
Celui-ci est tout bonnement affreux :
```js
part.paths[part.getId()] = new Path()
  .move(new Point(12,23))
  .line(new Point(234,11))
  .line(new Point(0,12))
```

## Partir dans le sens anti-horaire

Parcourez vos chemins dans le sens anti-horaire.

Cela s'applique à la fois au fait de nommer les points (en particulier les points de contrôle des courbes)
et à l'ordre dans lequel vous définissez vos points.

Evidemment, l'ordre dans lequel vous ajoutez vos points à votre code doit être relégué au second plan 
par rapport à la logique de votre code. Mais généralement, ce que vous faites c'est construire le contour 
(d'une partie) d'un vêtement.

Alors choisissez un point, et faites votre chemin dans le sens anti-horaire. 

Lorsque vous nommez les points de contrôle pour les coubes, réutilisez le nom du point auquel ils sont rattachés
et ajoutez `Cp1` au point de contrôle précédant le point et `Cp2` au point de contrôle qui lui succède si, 
une fois encore, vous parcourez votre chemin dans le sens anti-horaire.


Par exemple :
```js
part.paths.seam = new Path()
  .move(points.hemCenter)
  .line(points.hemSide)
  .line(points.waistSide)
  .curve(points.waistSideCp2, points.armholeCp1, points.armhole)
```

## Utiliser des pourcentages dans les options

Ne cédez pas à la tentation d'ajouter des valeurs absolues à vos patrons, vu qu'elles ne vont pas s'adapter à une échelle donnée. 
Au lieu de ça, adoptez des pourcentages comme options.

## Ne pas réinventer la roue

###### Réutiliser les mesures existantes

Lorsque vous concevez des patrons, réutilisez autant que possible les mesures qui sont déjà d'usage.
Personne n'est gagnant quand chaque patron nécessite son propre set de mesures, ou nomme
certaines mesures différemment.

> ######  Voir les packages de nos modèles pour les noms de mesure standards
> 
> Le package des [modèles freesewing](https://github.com/freesewing/models)
> contient tous nos noms de mesure standards.

###### Réemployer les options existantes

La même chose est (en quelque sorte) valable pour les options. Bien que votre patron puisse requérir à 
quelques options très spécifiques, il y en a surement une poignée qui est similaire à d'autres patrons. 
Réutilisez ces noms.

Par exemple, `bicepsEase` (aisance du bras) existe. Alors n'allez pas créer une option `upperArmEase` (aisance du bras supérieur).

###### Réutiliser les classes CSS

Alors que vous pouvez styliser votre patron de la manière que vous voulez, essayez tout de même de réutiliser les noms de classes CSS 
qui sont d'usage dans notre [plugin de thème](https://github.com/freesewing/plugin-theme) par défaut.

Le faire de cette manière assure une esthétique homogène à nos patrons.

## Séparer votre code

Créez un fichier par partie de patron que vous incluez. Plutôt que d'avoir tout votre code dans un seul fichier.

## Utiliser des clés de traduction, plutôt que du texte

N'insérez pas du texte littéral dans vos patrons. Au lieu de cela, insérez une clé qui ainsi peut être traduite.

Par exemple, si vous voulez mettre *Finish with bias tape* (finir avec du ruban de biais) dans votre patron, ne soyez 
pas tenté de faire ceci :

```js
path.seam.attr("data-text", "Finish with bias tape");
```

Cette chaîne de caractères (en anglais) est alors programmée en dur dans votre patron. Comme freesewing prend en charge 
la traduction, ce serait vraiment dommage de ne pas l'employer.

A là place, insérer une clé pour identifier la chaîne de caractères :

```js
path.seam.attr("data-text", "finishWithBiasTape");
```

## Utiliser le test de l'homme-fourmi


Lorsque vous concevez des patrons, vous devriez vous abstenir d'utiliser des valeurs absolues.

Cette aisance de 6 cm que vous ajoutez est peut-être correcte pour tous les scénarios que vous avez testés, 
mais c'est alors que quelqu'un qui fait deux fois votre taille fait son apparition, ou bien quelqu'un qui fabrique des vêtements pour une poupée, 
et là, les choses déraillent.

Pour vérifier que vos patrons se mettent bien à l'échelle, vous pouvez 
utiliser [le test de l'homme-fourmi](https://github.com/freesewing/antman) en échantillonnant votre patron pour 2 mannequins :

 - Un mannequin avec les mensurations d'une personne moyenne (l'homme)
 - Un mannequin avec le dixième des mensurations d'une personne moyenne (la fourmi)

Un patron bien conçu va diminuer son échelle d'un facteur 10 et garder sa forme. 
Si votre patron a des présomptions sur la taille, ce test le mettra en évidence.
