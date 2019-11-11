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
 - **Mesures**: Il est essentiel de prendre des mesures précises pour obtenir de bons résultats avec nos modèles ; ce n'est pas aussi futile que vous le pensez.

Bien que nous n'en soyons certainement pas encore là, nous avons fait des progrès sur ces deux points. Voyons ce que nous avons déjà réussi :

### Options de patron : Nous avons maintenant un mode expert, et il est désactivé par défaut

(certains de) Nos patrons ont des *options avancées* depuis un certain temps, mais ils sont maintenant cachés par défaut. That is until you turn on the **Expert mode** in the settings (below the pattern options).

Apart from advanced pattern options, export mode also reveals the lesser-used draft settings such as the ability to change the language, units, details, margin, and contents of your draft.

![Advanced mode](recreate.png)

<Note> 

###### Also shown: Pattern vs Recipe defaults

When configuring your draft, every option has a little button to restore the default value for that option.
Things get more complicated when you're re-creating a recipe. Now when you restore the default, is it the pattern default, or the recipe's default?

The answer used to be the pattern default, but with this release, you'll find that options where the recipe default is different from the pattern
default will have two buttons. Once to restore the pattern default, and another to restore the recipe default. 

You can see this in the screenshot above.

</Note>

### Measurements: Helping you spot mistakes in your measurements

We've added a few indicators to help you spot mistakes or problems in your measurements. Your models will now show a graphical representation of your body measurements, which will allow you to spot any outliers.

![A graphical representation of your model's measurements](model.png)

In addition, we are showing you an estimate of your different measurements (based on your neck circumference) next to the actual value. If the difference gets larger, we'll draw your attention to that.

This is a difficult area for us to work in. We want to help you get the best results, and that includes helping you spot issues with your measurements. On the other hand, we in no way want to imply that someone's measurements are *wrong* somehow.

We are an extremely size-inclusive pattern outlet, and a disproportionate amount of our users are people who struggle to find clothes or patterns from other outlets. So on one hand, it might seem like we're setting ourselves up for failure by comparing measurements to a set of more or less *standard* measurements. But you know your body. You know which of your measurements deviate from the average. And us pointing out that they do is in a way only confirmation that you've been measuring correctly. On the other hand, if something jumps out where you are fairly average sized, you know to double-check those measurements.

Last but not least, while we try to provide guidance about measurements to help spot mistakes, we never exclude anyone based on size or measurement. No matter what you throw at us, we will  draft a pattern that works for you, or (our software will) die trying.

## Other changes

 - We have extended our size ranges for our comparison views. Menswear sizes are now sampled from size 32 up to 48, while womenswear is sampled from size 28 up to 46.
 - We've made some changes to the defaults in the Simon pattern, based on our tests with Simone
 - We've added support for preloading models with breasts to our development environment for pattern designers
 - We've implemented fixes and improvements in our Jaeger, Bruce, Benajamin, Simon, Carlton, and Carlita patterns
 - We've added a bunch of missing images in the documentation, and [started an effort to make sure all options have an image to illustrate their purpose](https://github.com/freesewing/freesewing.org/issues/190).

More information is available [in the changelog](https://github.com/freesewing/freesewing/blob/develop/CHANGELOG.md).

We hope you enjoy this release, and please [stop by our chat room](https://gitter.im/freesewing/chat) to share your thoughts, feedback, suggestions, or ideas. We'd love to hear from you 

