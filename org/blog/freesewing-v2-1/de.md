---
date: 2019-10-06
title: "FreeSewing v2.1: Drei neue Muster, Expertenmodus und Hilfe beim Massnehmen"
linktitle: "Drei neue Muster in FreeSewing v2.1"
img: ceiling.jpg
caption: "In diesem Beitrag geht es hauptsächlich um unsere Arbeit an der progressiven Offenlegung. Außerdem: Drei neue Schnittmuster!"
author: joost
---

Wir haben gerade FreeSewing v2.1 veröffentlicht 🎉

## Treffen Sie Penelope, Waralee und Simone

Es gibt 3 neue Schnittmuster in dieser Version:

 - [Penelope](/patterns/penelope) ist ein Bleistiftrock von [Wouter Van Wageningen](/users/wouter.vdub)
 - [Waralee](/patterns/waralee) sind Wickelhosen, auch von [Wouter](/users/wouter.vdub)
 - [Simone](/patterns/simone) ist Simon (unser vielseitiges Button-Down-Muster) für Brüste angepasst durch [Joost De Cock](/users/joost)

Alle diese Muster sind entweder Damenmode oder - im Falle von Waralee - Unisex-Kleidung. Was ein Zeichen für unser Engagement ist, mehr Damenmode auf die Website zu bringen.

Neben der Entwicklung neuer Muster sind viele Anstrengungen unternommen worden, um die Dinge einfacher zu machen, ohne sie dümmer zu machen. Lassen Sie mich das erklären:

## Unsere Arbeit an der progressiven Offenlegung

Eine Balance zu finden, die es unseren Nutzern ermöglicht, die gesamte Leistungsfähigkeit der Plattform zu nutzen und gleichzeitig den Einstieg für Neueinsteiger zu erleichtern, ist eine ständige Herausforderung. Wir haben begonnen, dieses Problem mit der sogenannten *progressiven Offenlegung der Komplexität* anzugehen.

Die Idee - die wir nicht erfunden haben, aber ein Konzept im UX-Design ist - ist es, die Erfahrung für die meisten Menschen zu vereinfachen, ohne die Fähigkeiten fortgeschrittenerer Benutzer einzuschränken.

Wir konzentrieren unsere Aufmerksamkeit für eine schrittweise Offenlegung auf zwei Bereiche, die diejenigen sind, mit denen unsere Benutzer am häufigsten zu kämpfen haben:

 - **Schnittmusteroptionen**: Unsere Schnittmuster haben oft Dutzende von Optionen. Das ist großartig für diejenigen, die gerne jedes Detail ihres Musters abstimmen, aber für Neulinge kann ein wenig überwältigend sein
 - **Masse**: Genaues Massnehmen ist entscheidend für gute Ergebnisse mit unseren Schnittmustern, aber nicht so trivial, wie Sie denken würden.

Obwohl wir noch nicht da sind wo wir hin wollen, haben wir bei beidem Fortschritte gemacht. Schauen wir uns an, worum es geht:

### Schnittmusteroptionen: Hier haben wir jetzt einen Expertenmodus, und der ist standardmäßig ausgeschaltet

(einige von) unseren Schnitten haben seit einiger Zeit *erweiterte Optionen*, aber die sind nun standardmäßig ausgeblendet. Das heißt, bis Sie den **Expertenmodus** in den Einstellungen (unterhalb der Schnittmusteroptionen) einschalten.

Neben den erweiterten Musteroptionen zeigt der Exportmodus auch die weniger verwendeten Entwurfseinstellungen wie die Möglichkeit, Sprache, Einheiten, Details, Nahtzugabe und Inhalt Ihres Entwurfs zu ändern.

![Advanced mode](recreate.png)

<Note> 

######## Auch angezeigt: Muster vs. Rezeptvorgaben

Wenn Sie Ihren Entwurf konfigurieren, verfügt jede Option über eine kleine Schaltfläche, um den Standardwert für diese Option wiederherzustellen.
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

