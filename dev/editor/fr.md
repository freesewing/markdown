---
title: Documentation pour les éditeurs
path: /fr/docs/editor
---
N'importe qui possédant un compte sur freesewing.org peut apporter des modifications à notre site web. 

Que ce soit pour une page de documentation (comme celle-ci), un article du blog ou de la galerie, si vous voyez quelque chose qui peut être amélioré, allez-y et modifiez-le.

Derrière le titre de chaque page, vous trouverez deux icônes sur lesquelles vous pouvez cliquer :

 - un crayon pour éditer la page
 - un logo GitHub qui vous redirige vers le fichier sur GitHub

Les deux icônes ont le même but : permettre à chacun de suggérer des modifications de notre contenu. 
Mais elles le font d'une manière légèrement différente.

## Faire des modifications en ligne

L'icône crayon va ouvrir un éditeur qui vous permettra de faire vos modifications directement ici sur le site web freesewing.org. Lorsque vous les enregistrez, elles seront soumises à révision.

Tout notre contenu est rédigé en MarkDown. Si vous découvrez ce langage pour la première fois, 
rendez-vous sur notre [page d'aide sur Markdown](/fr/docs/markdown/) et vous verrez que c'est vraiment facile.

## Faire des modifications via GitHub

Ceux qui sont déjà familiers avec git et GitHub peuvent créer un fork de [notre dépôt pour le site web](https://github.com/freesewing/website), effectuer tous les changements qu'ils veulent, puis soumettre une pull request.

C'est sensiblement la même chose que ce que l'éditeur en ligne fait dans les coulisses. 
Mais cela vous permet de travailler dessus hors ligne et d'utiliser l'éditeur MarkDown de votre choix.

En parlant de ça, tout notre contenu qui est écrit en MarkDown est stocké sur le dossier [`src/markdown`](https://github.com/freesewing/website/tree/develop/src/markdown) de [notre dépôt pour le site web](https://github.com/freesewing/website).
Il y a trois sous-dossiers car nous avons trois types de contenu :
 
 -  [`docs`](https://github.com/freesewing/website/tree/develop/src/markdown/docs) : notre documentation
 -  [`blog`](https://github.com/freesewing/website/tree/develop/src/markdown/blog) : les articles du blog
 -  [`showcase`](https://github.com/freesewing/website/tree/develop/src/markdown/showcase) : les articles de la galerie
 
La seule différence réside dans le fait que ces deux méthodes ont différentes *données d'entête (frontmatter)*, qui sont des métadonnées incluses en début de fichier. La documentation a un titre, mais l'article de blog a un titre et une image, et ainsi de suite. Ces informations sont stockées dans l'entête au début de chaque fichier.

Chaque page de documentation, chaque article du blog et de la galerie repose sur son propre répertoire, avec un fichier MarkDown pour chaque langue.
