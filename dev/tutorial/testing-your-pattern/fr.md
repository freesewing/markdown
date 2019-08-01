---
title: Tester votre patron
order: 250
---

Avec le contour de base de votre patron prêt, il est maintenant temps de le tester pour voir à quel point il s'adapte bien à différentes mesures, et à l'étendue des options que nous avons fournie.

<tip>

###### Plus besoin de gradation

Les patrons FreeSewing sont faits *sur mesures*, ce qui signifie que vous n'avez pas besoin de grader votre patron pour fournir un ensemble de tailles. Vous pouvez échantillonner votre patron pour différentes mesures et options pour voir s'il s'adapte correctement.

</Tip>

Si le fait de tester votre patron vous semble une masse de travail conséquente, c'est votre jour de chance. FreeSewing peut le faire pour vous. Cliquez sur le bouton **Tester votre patron** dans la barre de navigation en haut de votre environnement de programmation, et vous verrez un nombre de choix possibles sur la droite :

- Tester les options du patron
- Tester les mesures
- Tester les modèles

Les [docs API sur l'échantillonnage](/api/pattern#sample) contiennent tous les détails de fonctionnement, mais pour le moment jetons juste un œil sur le résultat final de chacun de ces choix.

## Tester les options du patron

Nous avons utilisé des options pourcentages, qui peuvent varier entre leurs valeurs minimales et maximales. Pour ces tests, FreeSewing va diviser cette étendue en 10 étapes et ébaucher votre patron pour chacune d'entre elle.

Cliquez sur n'importe quelle option que nous avons ajoutée au patron, et votre bavoir sera dessiné avec une échantillonnage de cet option.

### lengthRatio

L'option `lengthRatio` contrôle la longueur de notre bavoir. La tester confirme qu'elle n'influence que la longueur :

<example caption="Your bib with the lengthRatio option sampled" sample part="bib" pattern="tutorial" settings={{ sample: { type: "option", option: "lengthratio" } }} />

### neckRatio

L'option `neckRatio` va déterminer la taille de l'encolure. Pour une même mesure de `headCircumference` (tour de tête), varier cette option devrait faire augmenter la largeur de l'encolure.

La tester confirme cela. Nous pouvons également voir que l'encolure devient plus étroite, les attaches seront tournées plus loin pour éviter qu'elles se chevauchent :

<example caption="Your bib with the neckRatio option sampled" sample part="bib" pattern="tutorial" settings={{ sample: { type: "option", option: "neckratio" } }} />

### widthRatio

L'option `widthRatio` détermine la largeur de notre bavoir. Pour une même mesure de `headCircumference` (tour de tête), varier cette option devrait donner des bavoirs de plus en plus larges.

Si nous testons cela, nous pouvons voir que cela fonctionne comme prévu. Mais il y a une chose qui requiert peut-être votre attention. Élargir le bavoir réduit la longueur depuis le bas de l'encolure jusqu'au bas du bavoir. Ce qui rend le bavoir plus court lorsqu'il est porté.

Même si la *longueur totale* de notre bavoir reste la même, la *longueur utile* est raccourcie lorsque le bavoir est élargi. Les utilisateurs ne s'attendent pas à cela, alors c'est une chose que nous devrions corriger dans notre patron.

<note>

Ajuster le patron pour éviter que le `widthRatio` n'influence la *longueur utilisable* de notre bavoir n'est pas explicité dans ce tutoriel. Ce problème est laissé comme *exercice pour le lecteur*.

</Note>

<example caption="Your bib with the widthRatio option sampled" sample part="bib" pattern="tutorial" settings={{ sample: { type: "option", option: "widthratio" } }} />

## Tester les mesures

Tester une mesure va faire varier cette mesure de 10% de plus ou de moins tout en laissant à l'identique tout le reste. Cela vous donne l'option de déterminer comment n'importe quelle mesure donnée influence le patron.

Pour notre bavoir, nous employons uniquement une mesure, alors elle influence le patron en entier :

<example caption="Your bib with the head circumference measurement sampled" sample part="bib" pattern="tutorial" settings={{ sample: { type: "measurement", measurement: "headcircumference" } }} />

## Tester les modèles

Tandis que le test des mesures va uniquement faire varier une seule mesure, tester des modèles va ébaucher votre patron pour différents sets de mesures, que l'on appelle *modèles*.

Sur la surface, le résultat ci-dessous est le même que pour notre test de mesure. Mais c'est parce que notre bavoir n'utilise qu'une seule mesure. Alors tester cette unique mesure revient au même que tester un set de mesures complet.

Mais la plupart des patrons utilise plusieurs mesures, et ce test vous donnera un aperçu de la façon dont votre patron s'adapte à différentes morphologies.

<example sample caption="Your bib sampled for a range of baby sizes" pattern="tutorial" part="bib" settings={{ sample: { type: "models", models: { baby1: headcircumference: 340 }, baby2: 350 baby3: 360 baby4: 370 baby5: 380 baby6: 390 baby7: 400 baby8: 410 baby9: 420 } } }} />

## Le test de l'homme fourmi

Le test de l'homme fourmi It drafts your pattern with a set of *typical* measurements , and then drafts it again with measurements that are 1/10th of those *typical* measurements.

It is named after [the cartoon character](https://en.wikipedia.org/wiki/Ant-Man_(film)) who can shrink, yet somehow his suit still fits.

The purpose of the antman test is to bring out areas in your pattern where you made assumptions that will not properly scale. Many drafting books will tell you to *add 3cm there* or *measure 2 inch to the right*. Those instructions don't scale, and you should avoid them.

The best patterns will pass the antman test with 2 exact pattern. One will simply be 1/10th the scale of the other.

<example sample caption="Congratulations, your bib passes the antman test" pattern="tutorial" part="bib" settings={{ sample: { type: "models", models: { ant: headcircumference: 39 }, man: 390 } } }} />

When you're happy with how your pattern passes these tests, it's time to complete it.