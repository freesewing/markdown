---
title: Concepts de base
path: /fr/docs/developer/concepts
---

Si vous débutez avec freesewing (ou SVG), il va falloir que nous abordions quelque concepts fondamentaux ensemble.

## Le système de coordonnées

Les coordonnées se présentent comme du texte dans un livre. 
Vous commencez en haut à gauche, vous allez vers la droite, et le fait d'aller vers le bas signifie que vous avancez.

![Le système de coordonnées SVG ; comme lire un livre](/fr/docs/developer/concepts/coordinates.svg)

## Unités

De façon interne, freesewing utilise le millimètre. 
Lorsque vous voyez 1, il s'agit d'1 mm. Lorsque nous disons 7,8, cela veut dire 7,8 mm.

Bien que nous prenons en charge des données de sorties métriques et impériales, toutes les données d'entrée doivent être en mm.

## SVG

Les patrons sont rendus sous forme de SVG, acronyme pour [Scalable Vector 
Graphics](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) —, 
un format d'image vectorielle basée sur XML, libre et standard.

Même si vous n'avez nul besoin d'être un expert en SVG, une compréhension basique
de ce format vous aidera grandement à comprendre freesewing.

## Courbes de Bézier

Alors que les lignes droites sur les ordinateurs sont facile à stocker avec un point de départ et un point d'arrêt, les courbes requièrent plus d'informations.

Dans freesewing, comme en SVG et nombre d'autres applications, les courbes sont stockées en tant que courbes de Bézier.
Elles ont :

 - Un point de départ
 - Un premier point de contrôle qui est lié au point de départ
 - Un second point de contrôle lié au point d'arrêt
 - Un point d'arrêt

Les courbes de Bézier sont plus intuitives que vous ne l'imaginez. Je trouve cette illustration plutôt utile :

![](/fr/docs/developer/concepts/bezier.gif)

## Patron vs Ebauche vs Modèle

Ce que *créer un nouveau patron" veut dire dépend du contexte.

Vous pourriez créer un nouveu modèle de patron, comme un costume de Spiderman.
Ou bien vous pourriez créer un nouvel exemple dudit modèle, avec vos propres mensurations et options.

Pour les utilisateurs finaux, nous parlons de *patron* en référence au modèle, 
alors qu'un exemple de ce patron est une *ébauche*.

Dans la documentation pour le développeur, nous utilisons en général le terme *patron* en référence au modèle sur lequel nous travaillons. 


## config vs réglages

Lorsque nous parlons de **config**, nous voulons dire la configuration du patron tel que l'a conçu le créateur/développeur du patron.

Par exemple, si oui ou non il y a une option pour changer le style de col est une affaire de config.

Lorsque nous disons **réglages**, nous parlons des réglages que l'utilisateur spécifie pour créer son ébauche.

Le fait d'inclure ou non des marges de couture est une affaire de réglages.

## ébauche vs rendu final

Générer un patron est un processus en deux étapes. D'abord, le patron est **ébauché**. 
Cela va calculer les coordonnées de tous les points, et faire tout ce qui est requis 
pour amener votre objet patron à un état où il disposera de toutes les informations requises pour donner un 
**rendu final**. Effectuer le rendu final transformera alors votre patron en un fichier de sortie SVG.

> ###### Vous ne voulez pas de SVG ? Pas de souci !
>
> La raison pour laquelle ces deux types d'objet sont séparés (ébauche et rendu final) est de donner la possibilité de prendre en charge différents formats de sortie.
> 
> Dans le cas où vous voudriez avoir un rendu final avec du PostScript, ou du HTML Canvas, vous pourriez écrire un plugin 
> qui fournirait une méthode de rendu personnalisée.

