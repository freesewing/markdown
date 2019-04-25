---
path: /fr/docs/translator/strings
title: Traduire des chaînes de caractères

---

Traduire les chaînes de caractères (ou modifier les chaînes de caractères déjà traduites)
peut être fait de deux manières :

 - Apporter des modifications en ligne sur une chaîne de caractères en particulier
 - Modifier les fichiers de traduction en eux-mêmes

Les deux sont valides, mais effectuer des changements en ligne se prête mieux pour mettre à jour rapidement
quelques chaînes de caractères. Si vous avez un travail de traduction conséquent,
il est probablement plus rapide de travailler avec les fichiers eux-mêmes.

Regardons les deux méthodes en détail :

## Apporter des modifications en ligne

De loin la façon la plus simple de travailler sur la traduction des chaînes de caractères est de se diriger 
vers [cette page](/fr/i18n) qui est le point de départ pour chercher, parcourir, et éditer nos chaînes de caractères traduites.

Vous pouvez chercher des chaînes de caractères, et il y a également une liste des différents sujets
par lesquels nos traductions sont catégorisés.

Un fois que vous avez trouvé ce dont vous avez besoin, cliquez sur le texte pour aller dans l'éditeur en ligne. Là, 
vous pouvez tout simplement faire les changements que vous voulez et les soumettre pour approbation.

Cette manière de faire est simple et rapide, mais si vous avez beaucoup de choses à traduire
cela sera surement plus rapide de travailler avec les fichiers de traduction eux-mêmes.

## Faire des modifications hors ligne

Si vous êtes familier avec git et GitHub, vous pouvez 
faire un fork [notre dépôt i18n](https://github.com/freesewing/i18n), 
faire les modifications souhaitées, et soumettre une pull request.

C'est grosso modo la même chose que ce que l'éditeur en ligne effectue derrière la scène. 
Mais cela vous permet de travailler hors ligne et d'utiliser l'éditeur de votre choix.

### Traduire des fichiers YAML

Toutes nos chaînes de caractères sont stockées dans des fichiers YAML dans 
le dossier [`src/locales`](https://github.com/freesewing/i18n/tree/develop/src/locales) de 
[notre dépôt i18n](https://github.com/freesewing/i18n).

Chaque langage possède son propre dossier, basé sur sa langue de code.
Par exemple, toutes les chaînes de caractères espagnoles sont dans le dossier `es`.

Dans chaque dossier de langue, il y a différents fichiers YAML à traduire, parfois 
il y aura aussi des sous-dossiers.

#### Structure YAML 

La syntaxe YALM repose sur des paires 'clé: valeur`. Voici un exemple :

```yaml
aboutFreesewing: About Freesewing
```

Vous ne traduisez jamais la clé, étant donné que c'est à travers elle que nous cherchons la traduction.
Vous ne traduisez que la valeur. Par exemple, dans le fichier pour l'espagnol, cela ressemble à :

```yaml
aboutFreesewing: Acerca de Freesewing
```

La plupart du temps, vous verrez ces simples paires `clé: valeur`.
Mais dans certains fichiers YAML, vous trouverez une structure hiérarchique, comme ce qui suit :


```yaml
adjustmentRibbon:
  description: Add a ribbon to make the tie adjustable.
  options:
    - Do not include ribbon
    - Include ribbon
  title: Adjustment Ribbon
```

Comme auparavant, ne traduisez pas les clés, seulement les valeurs. Dans notre cas, la version espagnole ressemble à ça :

```yaml
adjustmentRibbon:
  description: Agregar une cinta para que corbata sea ajustable.
  options:
    - No incluir una cinta
    - Incluir una cinta
  title: Cinta de ajuste 
```

#### Syntaxe

La plupart des chaînes de caractères sont juste du texte, mais parfois vous trouverez un peu de balisage dedans.

##### Formattage HTML

Lorsque vous rencontrez des tags HTML, traduisez simplement autour d'eux. Par exemple:

```yaml
profileShareAnswer: '<b>No</b>, never.'
```

ressemble à ça en espagnol :

```yaml
profileShareAnswer: '<b>No</b>, nunca.'
```

##### Caractères de remplacement

Lorsque vous rencontrez une *{clé}` entre des accolades, laissez-la comme telle.
Elle sera remplie plus tard avec la valeur correcte. Par exemple :

```yaml
fieldSaved: "{field} saved"
```

ressemble à ça en espagnol


```yaml
fieldSaved: "{field} guardado"
```

