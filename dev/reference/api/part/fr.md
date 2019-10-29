---
title: Part
---

Les objets partie (part) contiennent les informations importantes, et ensemble  composent votre modèle.

Chaque objet Part vient avec les propriétés suivantes :

 - `paths` : un objet simple dans lequel stocker vos chemins
 - `points` : un objet simple dans lequel stocker vos points
 - `render` : un drapeau qui contrôle le fait d'inclure la partie dans la sortie affichée
 - `snippets` : un objet simple dans lequel stocker vos snippets

De plus, un objet Part expose les méthodes suivantes :

## copy()

```js
Part part.copy(Part original)
```

Cela copiera les points, les chemins et les snippets à partir d'une partie, que vous lui transmettez.

<Note>

Cette méthode est utilisée en interne, vous n'en aurez probablement pas besoin.

If you want one part to build on another, you should set 
up [part inheritance](/advanced/inject)  in your pattern's [configuration](../config) file.

</Note>

## getId()

```js
int part.getId()
```
Retourne une valeur entière comme identifiant disponible que vous pouvez utiliser pour des Points/Chemins/Snippets.

C'est généralement utilisé lors de l'ajout programmé de points.


## shorthand()

```js
object Part.shorthand();
```

Cette méthode retourne un objet simple aux propriétés suivantes :

  - `Point` : the [Point](/reference/api/point) constructor
  - `points` = `part.points`
  - `Path` : the [Path](/reference/api/path) constructor
  - `paths` = `part.paths`
  - `Snippet` : the [Snippet](/reference/api/snippet) constructor
  - `snippets` = `part.snippets`
  - `measurements` = `pattern.settings.measurements`
  - `options` = `pattern.settings.options`
  - `sa` = `pattern.settings.sa`
  - `utils` : A [Utils](/reference/api/utils) instance with utility methods
  - `units` : une version consciente du contexte de `utils.units`
  - `macro` : la macro runner
  - `store` = `pattern.store`, a [Store](/reference/api/store) instance that is shared across parts
  - `final` : `true` si c'est une ébauche complète, ou `false` si c'est un échantillon.
  - `paperless` = `pattern.settings.paperless`

Comme son nom l'indique, cette méthode peut vous épargner pas mal d'écriture et garder votre code concis. Nous la recommandons vivement. En voici quelques exemples :

### Part.shorthand() example

```js{16}
// vous pourriez écrire ceci :
part.points.from = new part.Point(
  pattern.measurements.chestCircumference / 2, 
  pattern.options.armholeDepth);

part.points.to = new part.Point(
  part.points.from.x + pattern.settings.sa, 
  part.points.from.y);

part.paths.example = new part.Path()
  .move(parts.points.from)
  .line(parts.points.to);

// ou utiliser le raccourci :
let { Point, points, measurements, options, sa } = part.shorthand();

points.from = new Point(
  measurements.chestCircumference / 2, 
  options.armholeDepth);

points.to = new part.Point(
  points.from.x + sa, 
  points.from.y);

paths.example = new Path()
  .move(points.from)
  .line(points.to);
```

<Tip>

Comme vous pouvez le voir dans l'exemple ci-dessus, vous pouvez/devriez charger seulement 
le raccourci dont vous avez besoin en utilisant la déstructuration d'objet.

</Tip>

## units()

```js
string part.units(nombre décimal)
```

Formate l'entrée (en mm) comme les unités demandées par l'utilisateur.

<Tip>

###### This method is available as shorthand

You can access this units method from the [Part.shorthand](#shorthand) method;

```js
let { units } = part.shorthand();
```

</Tip>



