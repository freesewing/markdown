---
date: 2019-10-06
title: "FreeSewing v2.1 : Trois nouveaux modèles, un mode expert et l'aide aux mesures"
linktitle: "Trois nouveaux modèles dans FreeSewing v2.1"
img: ceiling.jpg
caption: "Ce message traite principalement de notre travail sur la révélation progressive. De plus : trois nouveaux modèles !"
author: joost
---

Nous venons juste de publier FreeSewing v2.1 <unk> 🎉

## Rencontrez Pénelope, Waralee et Simone

Il y a 3 nouveaux modèles dans cette nouvelle version :

 - [Penelope](/patterns/penelope) est une jupe crayon de [Wouter Van Wageningen](/users/wouter.vdub)
 - [Waralee](/patterns/waralee) est un pantalon "pareo" (aussi dit thaïlandais), aussi de [Wouter](/users/wouter.vdub)
 - [Simone](/patterns/simone) est Simon (notre versatile patron boutonné) adapté pour les seins, de [Joost De Cock](/users/joost)

Tous ces patrons sont des vêtements féminins ou -- dans le cas de Waralee -- unisexes. Ceci est donc une démonstration de notre engagement à apporter plus de modèles de vêtements féminins sur le site.

En plus de créer de nouveaux modèles, de nombreux efforts ont été réalisés pour simplifier les choses, sans les rendre plus limitées. Je m’explique :

## Notre travail sur la révélation progressive

Trouver un équilibre entre donner à nos utilisateurs toute la puissance de la plate-forme, tout en facilitant le démarrage des nouveaux arrivants, est un défi permanent. Nous avons commencé à faire des progrès dans la résolution de ce problème avec ce que l'on appelle *révélation progressive de la complexité*.

L'idée -- que nous n'avons pas inventée, mais c'est un concept dans la conception d'UX (= expérience utilisateur) -- est de simplifier l'expérience pour la majorité des gens sans limiter les capacités des utilisateurs plus avancés.

Nous concentrons notre attention pour la révélation progressive sur deux sujets pour lesquels nos utilisateurs débattent le plus souvent :

 - **Options des patrons** : Nos patrons offrent souvent une douzaine d'options. C'est génial pour ceux qui aiment affiner chaque détail de leur modèle, mais peut-être un peu accablant pour les nouveaux arrivants
 - **Mesures** : Il est essentiel de prendre des mesures précises pour obtenir de bons résultats avec nos modèles ; ce n'est pas aussi futile que vous le pensez.

Bien que nous n'en soyons certainement pas encore là, nous avons fait des progrès sur ces deux points. Voyons ce que nous avons déjà réussi :

### Options de patron : Nous avons maintenant un mode expert, et il est désactivé par défaut

(certains de) Nos patrons ont des *options avancées* depuis un certain temps, mais ils sont maintenant cachés par défaut. Ceci jusqu'à ce que vous activiez le **Mode Expert** dans les paramètres (ci-dessous les options de patron).

Hormis les options avancées de patron, le mode export révèle également les paramètres de brouillon moins utilisés comme la possibilité de changer la langue, l'unité, les détails, les marges et le contenu de votre brouillon.

![Mode avancé](recreate.png)

<Note> 

###### Également affiché : Patron vs Recette par défaut

Lors de la configuration de votre brouillon, chaque option a un petit bouton pour restaurer la valeur par défaut de cette option.
Les choses deviennent plus compliquées lorsque vous recréez une recette. Maintenant, lorsque vous restaurez la valeur par défaut, est-ce le patron par défaut ou la recette par défaut ?

La réponse était le modèle par défaut, mais avec cette nouvelle version, vous verrez que les options où la valeur par défaut de la recette est différente du patron
auront deux boutons. Un pour restaurer le patron par défaut, et un autre pour restaurer la recette par défaut. 

Vous pouvez le voir dans la capture d'écran ci-dessus.

</Note>

### Mesures : Vous aider à détecter les erreurs dans vos mensurations

Nous avons ajouté quelques indicateurs pour vous aider à repérer des erreurs ou des problèmes dans vos mesures. Vos modèles afficheront maintenant une représentation graphique de vos mensurations, ce qui vous permettra de repérer les erreurs potentielles.

![Une représentation graphique des mensurations de votre modèle](model.png)

De plus, nous vous présentons une estimation de vos différentes mensurations (basées sur votre circonférence du cou) comparées à la valeur réelle. Si la différence s'accentue, nous attirerons votre attention sur ce point.

C'est un travail difficile pour nous. Nous voulons vous aider à obtenir les meilleurs résultats, notamment en vous aidant à repérer les problèmes liés à vos mesures. D'un autre côté, nous ne voulons en aucun cas impliquer que les mesures de quelqu'un sont *erronées* d'une manière ou d'une autre.

We are an extremely size-inclusive pattern outlet, and a disproportionate amount of our users are people who struggle to find clothes or patterns from other outlets. So on one hand, it might seem like we're setting ourselves up for failure by comparing measurements to a set of more or less *standard* measurements. But you know your body. You know which of your measurements deviate from the average. And us pointing out that they do is in a way only confirmation that you've been measuring correctly. On the other hand, if something jumps out where you are fairly average sized, you know to double-check those measurements.

Enfin et surtout, alors que nous essayons de fournir des conseils sur les mesures pour aider à détecter les erreurs, nous n'excluons jamais quiconque en fonction de sa taille ou de ses mensurations. No matter what you throw at us, we will  draft a pattern that works for you, or (our software will) die trying.

## Autres modifications

 - Nous avons étendu notre gamme de tailles pour nos vues de comparaison. Les tailles de vêtements pour hommes sont maintenant échantillonnées de la taille 32 à 48, tandis que les vêtements pour femmes sont échantillonnés de la taille 28 à 46.
 - Nous avons modifié les paramètres par défaut dans le modèle Simon, basé sur nos tests avec Simone
 - Nous avons ajouté la prise en charge des modèles prédéfinis avec seins dans notre environnement de développement pour les concepteurs de patrons
 - Nous avons implémenté des corrections et des améliorations dans nos patrons Jaeger, Bruce, Benajamin, Simon, Carlton et Carlita
 - Nous avons ajouté un tas d'images manquantes dans la documentation, et [ débuté un travail pour s'assurer que toutes les options ont une image pour illustrer leur objectif](https://github.com/freesewing/freesewing.org/issues/190).

Plus d'informations sont disponibles [dans le suivi des modifications](https://github.com/freesewing/freesewing/blob/develop/CHANGELOG.md).

Nous espérons que vous apprécierez cette version, et [passerez dans notre salon de discussion](https://gitter.im/freesewing/chat) pour partager vos pensées, vos commentaires, vos suggestions ou vos idées. Nous aimerions connaître votre avis. 

