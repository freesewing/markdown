- - -
- - -

import PatternOptions from '../../../../../../src/components/docs/pattern-options'

<PatternOptions pattern='brian' />

## Comprendre la tête de manche

Dans la version 2 de FreeSewing, la tête de manche de Brian a été redessinée, pour mieux s'adapter à différents types de manches et de vêtements. La tête de manche dispose maintenant de 20 options de forme. Bien que cela puisse paraître un peu assommant de prime abord, comprendre la conception de la tête de manche facilite la compréhension des différentes options.

### La bounding box

La *bouding box* de la tête de manche est un rectangle de la largeur de la manche et de la hauteur de la tête de manche. La tête de manche va être construite dans ce rectangle.

![The Brian sleevecap](sleevecap.svg)

L'image ci-dessus montre une tête de manche, commençant au point 1, puis montant jusqu'au point 4, et ensuite redescendant au point 2. 

<Note>

###### Repérer le devant de la manche

Dans notre exemple, le devant de la manche est à droite. Mais comment le sait-on direz vous ? 

Alors que les patrons l'indiquent généralement par des repères (une seule encoche pour le devant, une double encoche pour l'arrière), on peut aussi repérer où se trouve le devant d'une tête de manche par sa forme plus courbe. La partie de la tête de manche qui sera placée à l'arrière est de forme plus aplatie. C'est en raison de la forme de l'épaule humaine, qui est plus arrondie sur le devant du corps. La tête de manche sera donc elle aussi plus courbée sur le devant, pour s'adapter à l'épaule.

</Note>

La largeur de la tête de manche (et donc la largeur de la manche à la base de l'emmanchure) est égale à la distance entre les points 1 et 2. Cette distance dépend des mesures du modèle, de l'aisance choisie, de la coupe du vêtement, etc. Pour notre tête de manche, la seule chose à savoir est qu'on commence avec une largeur donnée. Et bien que cette largeur puisse être influencée par d'autres facteurs, nous ne pouvons pas la modifier par les options de la tête de manche.

![Controlling the top of the sleevecap](sleevecaptop.svg)

La hauteur de la tête de manche est égale à la distance entre les points 3 et 4. La hauteur exacte est un compromis entre les mesures du modèle, les options, la facilité, tête de manche facilement, et le fait que la manche doit finalement être ajustée à l'armure. Cette hauteur peut donc varier, et on ne peut choisir sa valeur exacte. Mais deux options permettent de contrôler la forme de notre tête de manche :

 - [Haut de tête de manche X](/docs/patterns/brian/options/sleevecaptopfactorx/) : Contrôle la position horizontale des points 3 et 4
 - [Sleevecap top Y](/docs/patterns/brian/options/sleevecaptopfactory/) : Controls the vertical placement of point 4

En d'autres termes, le point 4 peut être placé plus haut ou plus bas, et, peut-être moins intuitif, peut aussi être déplacé plus à droite ou plus à gauche, plutôt que rester en plein au milieu comme dans notre exemple.

### Les points d'inflexion

![Controlling the inflection points](sleevecapinflection.svg)

Avec les points 1, 2, 3 et 4 en place, nous avons un rectangle pour dessiner notre tête de manche. Now it's time to map out our *inflection points*. These are points 5 and 6 on our drawing, and their placement is determined by the following 4 options:

 - [Sleevecap back X](/docs/patterns/brian/options/sleevecapbackfactorx) : Controls the horizontal placement of point 5
 - [Sleevecap back Y](/docs/patterns/brian/options/sleevecapbackfactory) : Controls the vertical placement of point 5
 - [Sleevecap front X](/docs/patterns/brian/options/sleevecapbackfactorx) : Controls the horizontal placement of point 6
 - [Sleevecap front Y](/docs/patterns/brian/options/sleevecapbackfactory) : Controls the vertical placement of point 6

<Note>

As you see in our example, these points do not always lie on our sleevecap line. Instead, they
are instrumental in creating the points that always lie on the sleevecap: the anchor points.

</Note>

### The anchor points

![Controlling the anchor points](sleevecapanchor.svg)

Ultimately, our sleevecap will be the combination of 5 curves. In addition to points 1 and 2, the four *anchor points* that are marked in orange in our example will be the start/finish of those curves.

The points are *offset* perpendicular from the middle of a line between the two anchor points surrounding them. The offset for each point is controlled by these 4 options:

 - [Sleevecap Q1 offset](/docs/patterns/brian/options/sleevecapq1offset) : Controls the offset perpendicular to the line from points 2 to 6
 - [Sleevecap Q2 offset](/docs/patterns/brian/options/sleevecapq2offset) : Controls the offset perpendicular to the line from points 6 to 4
 - [Sleevecap Q3 offset](/docs/patterns/brian/options/sleevecapq3offset) : Controls the offset perpendicular to the line from points 4 to 5
 - [Sleevecap Q4 offset](/docs/patterns/brian/options/sleevecapq3offset) : Controls the offset perpendicular to the line from points 5 to 1

<Note>

We've divided our sleevecap into 4 quarters. We start at the front (the right in our example)
with quarter 1, and make our way to the back to end with quarter 4.

Like the offset option, the last options to determine the shape of our sleevecap will just repeat so you can 
control each quarter individually.

</Note>

### The spread

![Controlling the anchor points](sleevecapspread.svg)

We now have all the start and end points to draw the 5 curves that will make up our sleevecaps. What we're missing are the control points (see [our info on Bézier curves](https://freesewing.dev/concepts/beziercurves) to learn more about how curves are constructed). These are determined by the so-called *spread*.

For each of the anchor points (the ones marked in orange, not points 1 and 2) there is an option to control the spread upwards, and downwards:

 - [Sleevecap Q1 downward spread](/docs/patterns/brian/options/sleevecapq1spread1) : Controls the downward spread in the first quarter
 - [Sleevecap Q1 upward spread](/docs/patterns/brian/options/sleevecapq1spread2) : Controls the upward spread in the first quarter
 - [Sleevecap Q2 downward spread](/docs/patterns/brian/options/sleevecapq2spread1) : Controls the downward spread in the second quarter
 - [Sleevecap Q2 upward spread](/docs/patterns/brian/options/sleevecapq2spread2) : Controls the upward spread in the second quarter
 - [Sleevecap Q3 upward spread](/docs/patterns/brian/options/sleevecapq3spread1) : Controls the upward spread in the third quarter
 - [Sleevecap Q3 downward spread](/docs/patterns/brian/options/sleevecapq3spread2) : Controls the downward spread in the third quarter
 - [Sleevecap Q4 upward spread](/docs/patterns/brian/options/sleevecapq4spread1) : Controls the upward spread in the fourth quarter
 - [Sleevecap Q4 downward spread](/docs/patterns/brian/options/sleevecapq4spread2) : Controls the downward spread in the fourth quarter

<Note>

Attentive readers will have noticed that point 4 is not an anchor point. In other words, there is no guarantee
that it will lie on the sleevecap line. Which also means that the upwards spread in quarters 2 and 3 will influence
the height of the sleevecap. Reduce the upwards spread, and the curve will dip below point 4. Increase it and
the curve will rise above it.

</Note>

### Takeaways

While the sleevecap in Brian (and all patterns that extend Brian) have a lot of options, understanding how the sleevecap is constructed can help you design the exact sleevecap shape you want. To do so:

 - Start with placing the top of your sleevecap
 - Then determine the inflection points
 - Next, use the offset to control the steepness of the curve
 - Finally, use the spread to smooth things out

What's important to remember is that you're only ever controlling the shape of the sleevecap. Whatever shape you design, it will be fitted to the armhole, meaning that its size can and will be adapted to make sure the sleeve fits the armscye. However, the shape you design will always be respected.

