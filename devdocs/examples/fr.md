---
path: /fr/docs/developer/examples
title:  Apprendre par l'exemple
components: true
---

## Créer un nouveau modèle de patron (design)

Pour créer un nouveau patron, appelez `new freesewing.Design()`.
Cela prend comme paramètres votre configuration de patron, 
et les plugins que vous voulez charger.

Par exemple, si nous voulons créer un nouveau patron nommé `Sorcha`:

```js
import freesewing from "freesewing";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";

// Création d'un nouveau modèle
const Sorcha = new freesewing.Design(config, plugins);
```

> ###### freesewing.Design() est un super-constructeur
>
> La seule fois où vous  utiliserez la méthode `freesewing.Design()` est lorsque 
> vous allez créer un nouveau modèle de patron. 
>
> Les constructeurs sont des fonctions que vous pouvez appeler avec `new` pour créer un objet. 
> Mais ce constructeur ne retourne pas un objet `Design`, mais une méthode de construction 
> pour votre patron.
>
> Voici un exemple :
>
> ```js
> import freesewing from "freesewing";
> import plugins from "@freesewing/plugin-bundle";
> import config from "../config";
> 
> // Création d'un nouveau modèle
> const Sorcha = new freesewing.Design(config, plugins);
>
> // Reste du code de votre patron
>
> export default Sorcha;
> ```
>
> Lors de l'import de votre patron, c'est lui-même un constructeur :
>
> ```js
> import Sorcha from "@freesewing/sorcha";
> 
> // Sorcha est un constructeur pour votre patron. 
> let pattern = new Sorcha();
> ```
> 
> Comme `freesewing.Design()` retourne un constructeur, vous pouvez le considérer comme un super-constructeur.

## Ajouter des parties de patrons (parts)

Etant donné que les parties de patrons sont listées dans 
[le fichier de configuration](/fr/docs/developer/config), freesewing a connaissance de toutes les parties 
qui constituent votre patron.

Le code s'attend à ce que chaque patron ait sa propre méthode d'ébauche, qui est appelée `draft`
suivi par le nom de la partie de patron avec la première lettre en majuscule.

Par exemple, si notre patron `Sorcha` possède une partie nommée `back`, vous devriez
avoir une méthode `draftBack`. Cela fait partie des bonnes pratiques que chaque partie ait son propre fichier, 
alors créez un fichier appelé `back.js`. A l'intérieur, vous exportez votre méthode 
pour ébaucher cette partie :

```js
export default part => {
  // Votre code pour cette partie
}
```

Alors, dans votre fichier `index.js`, vous importez ce fichier, et joignez la 
méthode au prototype de votre patron :

```js
import freesewing from "freesewing";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";
// Parties
import draftBack from "./back";

// Création d'un nouveau modèle
const Sorcha = new freesewing.Design(config, plugins);

// Méthodes d'ébauche par partie
Sorcha.prototype.draftBack = part => draftBack(part);
```

## Enrichir d'autres patrons

Si votre patron enrichit, ou se base sur un autre patron, vos 
parties de patron devront être ébauchées par le patron parent.

Dans ce cas, plutôt que de retourner votre propre méthode d'ébauche pour cette partie, 
vous devriez instancier le patron parent, et retourner la méthode d'ébauche de sa partie :

```js
import freesewing from "freesewing";
import Brian from "@freesewing/brian";
import plugins from "@freesewing/plugin-bundle";
import config from "../config";
// Parties
import draftBack from "./back";

// Création d'un nouveau modèle
const Sorcha = new freesewing.Design(config, plugins);

// Méthodes d'ébauche par partie
Sorcha.prototype.draftBack = part => draftBack(part);
Sorcha.prototype.draftBase = function(part) {
  // Obtention de la partie de base à partir de Brian
  return new Brian(this.settings).draftBase(part);
};
```

> ###### N'utilisez pas de fonction directionnelle lorsque vous employez cela
>
> Parce que nous utilisons le mot-clé `this` ici, vous ne pouvez pas employer 
> une notation de flèche pour ces méthodes.

## Utilisation d'abbréviations (shorthand)

La méthode [Part.shorthand()](/api/part/#shorthand) va devenir votre meilleure amie.

En utilisant la [destructuration d'objet](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Object_destructuring) vous allez avoir accès à un ensemble de 
de variables pratiques pour rendre votre code plus concis et lisible.

[Part.shorthand()](/api/#part-shorthand) fournit beaucoup de choses, et vous n'aurez globalement 
pas besoin de tout, mais voici tout ce qu'elle a à offrir :

```js
  let {
    options,      // Options du patron
    measurements, // Mensurations du modèle
    Point,        // Constructeur de point
    Path,         // Constructeur de chemin
    Snippet,      // Constructeur de fragment
    points,       // Contient les points des parties
    paths,        // Contient les chemins des parties
    snippets,     // Contient les fragments des parties
    store,        // Le store vous permet de partager des données entre différentes parties
    utils,        // Une collection d'utilitaires
    macro,        // Méthode pour appeler une macro
    debug,        // Méthode pour enregistrer les info de débugage
    sa,           // Marge de couture demandée
    final,        // Ebaucher ou non un patron complet
    paperless,    // Ebaucher ou non un patron sans papier
    units,        // Unités demandées
  } = part.shorthand();
```

Nous allons utiliser notre notation  
[shorthand](#using-shorthand)
dans les exemples qui suivent.

## Accéder aux mensurations (measurements)

Les mesures sont stockées dans `pattern.settings.measurements`, mais grâce à notre appel préalable à 
[shorthand](#using-shorthand), 
nous pouvons simplement écrire :

```js
let quarterChest = measurements.chestCircumference / 4;
```
## Accéder aux options
Même histoire pour les options, qui sont stockées dans `pattern.settings.options`.

Après un appel à
[shorthand](#using-shorthand), 
nous pouvons écrire :

```js
let sleeveBonus = measurements.shoulderToWrist * (1 + options.sleeveLengthBonus);
```

## Ajouter des points (points)

Après notre appel à 
[shorthand](#using-shorthand), 
**Point** contient le constructeur de point, alors que **points** fait référence à `part.points`,
où vous devriez stocker vos points.

A présent, les choses vont *juste marcher* lorsque nous écrivons ceci :

```js
points.centerBack  = new Point(0,0);
```

## Ajouter des chemins (paths)
Avec notre appel plus tôt à 
[shorthand](#using-shorthand), 
**Path** contient maintenant le constructeur de chemin, alors que **paths** fait référence auis a reference to `part.paths`,
où vous devriez stocker vos chemins.

Nous pouvons maintenant faire ceci :

```js
paths.example = new Path();
```

## Ajouter des fragments (snippets)

Enfin, notre appel à  
[shorthand](#using-shorthand)
fournit également un constructeur de fragment dans **Snippet**, et **snippets** est l'endroit où stocker nos fragments :

```js
snippets.logo = new Snippet('logo', points.logoAnchor);
```

Vous pouvez également changer l'échelle et tourner un fragment en réglant respectivement les attributs `data-scale` et `data-rotate`.

 - **data-scale** : Soit un facteur d'échelle unique, ou bien un set de 2 facteurs d'échelle pour les axes X et Y respectivement. Voir [La transformation d'échelle SVG](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform#Scale) pour plus de détails.
 - **data-rotate**: Une rotation en degrés. Le centre de cette rotation sera le point d'ancrage du fragment.

## Utiliser les attributs

Les points (Points), chemins (Paths) et fragments (Snippets), ont tous des [attributs](/api/#attributes) que vous employez pour influencer leur comportement.

Un scénario commun est d'appliquer des classes CSS pout donner un style à un chemin ;

```js
paths.example.attr('class', 'lining dashed');
```

> ###### attr() est une abbréviation pour régler des attributs
>
> Nous utilisons ici la méthode [Path.attr()](/api/#path-attr).
> Nous aurions également pu accéder à la propriété `attributes` du chemin et appeler 
> [Attributes.add()](/api/#attributes-add) dessus comme ça :
> 
> ```js
> paths.example.attributes.add('class', 'lining dashed');
> ```
> Mais le moins est le mieux, n'est-ce-pas ?

## Adding text

Il y a un autre usage moins intuitif des attributs qui consiste à ajouter du texte à votre patron.

Pour ajouter du texte, tout ce que vous avez à faire est de l'ajouter à l'attribut `data-text`.
De plus, tous les attributs qui ont un préfixe `data-text-` vont s'appliquer au texte, plutôt que le point :

<api-example o="point" m="attr" box="1" strings='{ "msg": "Hello world!\nThis is\na line break"}'></api-example>

> ###### Texte multiligne
> 
> Notre example ci-dessus a plus d'un tour dans son sac : le texte multiligne.
> Ajouter un caractère de saut de ligne (`\n`) à votre texte fera démarrer une nouvelle ligne.
> 
> Malheureusement, la prise en charge du texte multiligne dans SVG est inégale au mieux. 
> Et bien que vous pouvez formatter votre texte avec des classes CSS, il n'y a pas de paragraphe dans SVG.
> 
> C'est pourquoi vous avez une arme secrète à disposition : l'attribut `data-text-lineheight`.
> Réglez-le, et nous vous rendrons votre SVG multiligne avec la hauteur de ligne que vous aurez choisi.
> 
> La hauteur de ligne par défaut pour du texte multiligne est de 12 mm.

## Texte sur des chemins

Le texte sur des chemins (une assez belle fonction de SVG) fonctionne exactement de la même manière que pour ajouter du texte sur des points.
Réglez simplement l'attribut `data-text`.

<api-example o="path" m="attr" strings='{ "msg": "I am text on a path"}'></api-example>

## Dessiner des cercles

De vrais cercles sont rarement utilisés dans la conception de patron, et ils ne font pas partie de la spécification de chemin SVG, 
mais représente plutôt un élément SVG différent.

Malgré tout, si vous voulez un cercle, vous pouvez en dessiner un en réglant un attribut de point `data-circle` 
au rayon du cercle que vous voulez dessiner.

De plus, tous les attributs qui ont un préfixe `data-circle-` vont s'appliquer au cercle, plutôt qu'au point.

<api-example o="utils" m="circlesintersect"></api-example>

## Ajouter une marge de couture

Grâce à notre appel à 
[shorthand](#using-shorthand),
la variable **sa** contient la marge de couture que notre utilisateur désire.

Tout ce que vous avez à faire est de laisser [Path.offset()](/api/#path-offset) faire le sale boulot à votre place.

<api-example o="settings" m="sa"></api-example>

## Utiliser des macros

Les macros sont un moyen de faciliter la conception de patron en groupant un ensemble d'actions individuelles dans une petite routine.

Les macros sont fournies par des [plugins](/extend/). En voici quelques exemples :

 - **grainline** : Ajoute un droit fil à votre patron
 - **cutonfold** : Ajoute un indicateur de découpe au pli à votre patron
 - **title** : Ajoute un nom de partie
 - **dimension** : Utilisé pour ajouter des dimensions sur un patron sans papier

Grâce à notre appel à 
[shorthand](#using-shorthand),
vous pouvez simplement appeler la méthode macro et introduire le nom de la macro que 
voulez lancer, et ses arguments :

<api-example o="plugin" m="dimension"></api-example>

## Transmettre des données entre différentes parties

Parfois, vous voudrez accéder aux données d'une autre partie.
Par exemple, vous allez peut-être stocker la longueur de l'emmanchure de vos parties devant et dos, 
et puis lire cette valeur avant d'ébaucher la manche de manière à pouvoir vérifier que la manche soit bien ajustée à l'emmanchure.

Notre appel à 
[shorthand](#using-shorthand)
fournit l'objet [Store](/api/#store) que vous pouvez employer pour cela.

```js
{ store } = parts.onePart.shorthand();
store.set('hello', 'world');

{ store } = parts.anotherPart.shorthand(); // Note: partie différente 
store.get('hello'); // Returns 'world'
```

Dans un cas comme celui-ci, vous devez vous assurer que `onePart` est ébauché avant 
`anotherPart`, ce qui est quelque chose que vous pouvez régler  dans votre [configuration de patron](/config/).
