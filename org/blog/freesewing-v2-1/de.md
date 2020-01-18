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
Die Dinge werden komplizierter, wenn Sie ein Rezept erneut erstellen. Wenn Sie nun den Standardwert wiederherstellen, ist es dann der Musterstandard oder der Standard des Rezepts?

Die Antwort war bisher: der Schnittmusterstandardwert, aber mit dieser Version werden Sie feststellen, dass Optionen, bei denen der Rezeptstandard vom Musterstandard abweicht, zwei Schaltflächen haben. Das eine stellt die Schnittmusterstandardwerte wieder her, das an die Standardwerte des Rezepts. 

Sie können dies im Screenshot oben sehen.

</Note>

### Masse: Helfen Ihnen die Fehler in Ihren gemessenen Massen zu entdecken

We've added a few indicators to help you spot mistakes or problems in your measurements. Ihre Modelle zeigen nun eine grafische Darstellung Ihrer Körpermaße, mit der Sie Ausreißer erkennen können.

![A graphical representation of your model's measurements](model.png)

Zusätzlich zeigen wir Ihnen neben dem Istwert eine Schätzung Ihrer verschiedenen Maße (bezogen auf Ihren Halsumfang). Wenn der Unterschied größer wird, werden wir Sie darauf aufmerksam machen.

This is a difficult area for us to work in. We want to help you get the best results, and that includes helping you spot issues with your measurements. On the other hand, we in no way want to imply that someone's measurements are *wrong* somehow.

We are an extremely size-inclusive pattern outlet, and a disproportionate amount of our users are people who struggle to find clothes or patterns from other outlets. So on one hand, it might seem like we're setting ourselves up for failure by comparing measurements to a set of more or less *standard* measurements. But you know your body. You know which of your measurements deviate from the average. And us pointing out that they do is in a way only confirmation that you've been measuring correctly. On the other hand, if something jumps out where you are fairly average sized, you know to double-check those measurements.

Last but not least, während wir versuchen, eine Anleitung für Messungen zu geben, um Fehler zu erkennen, schließen wir niemanden aus egal in welcher Größe oder Abmessung. No matter what you throw at us, we will  draft a pattern that works for you, or (our software will) die trying.

## Weitere Änderungen

 - Für unsere Vergleichsansichten haben wir unsere Größenbereiche erweitert. Die Größen für Herrenmode werden jetzt von Größe 32 bis 48 gesampelt, während für Damenmode von Größe 28 bis 46.
 - Wir haben einige Änderungen an den Standardeinstellungen im Simon-Muster vorgenommen, basierend auf unseren Tests mit Simone
 - Wir haben unsere Entwicklungsumgebung für Schnittmusterdesigner um die Möglichkeit erweitert, Modelle mit Brüsten als Preload einzustellen
 - We've implemented fixes and improvements in our Jaeger, Bruce, Benajamin, Simon, Carlton, and Carlita patterns
 - We've added a bunch of missing images in the documentation, and [started an effort to make sure all options have an image to illustrate their purpose](https://github.com/freesewing/freesewing.org/issues/190).

More information is available [in the changelog](https://github.com/freesewing/freesewing/blob/develop/CHANGELOG.md).

We hope you enjoy this release, and please [stop by our chat room](https://gitter.im/freesewing/chat) to share your thoughts, feedback, suggestions, or ideas. We'd love to hear from you 

