---
path: /fr/docs/translator/content
title: Traduire du contenu
---

## Pour démarrer

Tous nos contenus sont écrit en [Markdown](/fr/docs/markdown). Vous pouvez trouver 
ces fichiers dans [le dossier markdown](https://github.com/freesewing/website/tree/develop/src/markdown)
de [notre dépôt pour le site web](https://github.com/freesewing/website).

Dedans, vous trouverez trois sous-dossiers:

 - `blog` : contenant nos articles du blog
 - `docs` : contenant la documentation
 - `showcase` : contenant les articles de la galerie

Pour traduire un article ou une page de documentation, trouvez tout d'abord le fichier en anglais qui est
toujours nommé `en.md`. Puis, copier le dans un nouveau fichier dans la langue dans laquelle vous souhaitez le traduire.
Par exemple, pour le traduire en français, copiez le dans `fr.md` dans le même répertoire.
Vous pouvez à présent traduire le fichier.

## Données d'entête

Au début d'un fichier MarkDown, vous trouverez les données d'entête comprises entre 
un début et une fin représentés par trois tirets `---`.

Elles portent les métadonnées de cette page, et la nécessité ou non de les traduire dépend du contexte.

Par exemple, voici les données d'entête de la version d'origine de cette page en anglais :

```
---
title: Translating content
---
```

Les données d'entête sont toujours sous la forme d'une paire `clé:valeur`, dans laquelle la clé n'est jamais traduite.
La traduction de la valeur dépend de la clé. Dans l'exemple ci-dessus,
vous traduiriez le titre de la page. Mais regardez donc les données d'entête d'un article de la galerie :

```
---
title: Sloppy Theodore trousers
img: showcase.jpg
caption: "Theodore Trousers"
patterns: [theodore]
author: cabi
---
```

Ici, vous traduirez le titre (title) et la légende (caption), mais vous ne devez pas traduire les autres métadonnées, 
qui sont des variables utilisées par le système, plutôt que du texte destiné à être lu par le visiteur.

Si vous avez un doute sur le fait de traduire ou non quelque chose, [vous pouvez demander à quelqu'un](https://gitter.im/freesewing/freesewing).

## Syntaxe

MarkDown est un moyen direct de formatter du texte vers du HTML. Vous allez vous y familiariser en un rien de temps.

La [documentation officielle sur MarkDown](https://daringfireball.net/projects/markdown/syntax) est un peu aride.
Vous trouverez peut-être [notre résumé des principales fonctions de MarkDown](/en/docs/markdown) plus plaisante à lire.

## Mettre à jour les liens de direction vers le bon langage

Lorsque vous faites un lien vers un autre endroit du site web, you devez mettre à jour le préfixe de langue. 

Par exemple, `/en/docs/i18n/markdown` redirige vers la version anglaise de cette page.
Alors que `/es/docs/i18n/markdown` pointe vers la version espagnole de cette page.

Il est important de mettre à jour ces liens, car ils déterminent la langue du site. 
Si vous traduisez cette page en espagnol, et que vous ne mettez pas à jour le lien, 
alors lorsque le visiteur cliquera sur ce lien, le site web va soudainement s'afficher en anglais au lieu de le faire en espagnol.
