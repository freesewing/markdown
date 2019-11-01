---
date: 2018-01-04
title: "Freenewing Core v1.3.0 ist verfügbar; Kommt mit Korrekturen, die so gut sind, dass wir sie zu all Ihren Entwürfen zurückportiert haben"
linktitle: "FreeSewing Core v1.3.0 ist released"
img: skales.jpg
caption: "Skalen, wie funktionieren sie?"
author: joost
---

Am letzten Tag des Jahres 2017 haben wir in unserer [monatlichen Zusammenfassung aller FreeSewing-News](/blog/roundup-2017-12/) über die sich abzeichnende Herausforderung mit falsch skalierten Entwürfen, auch bekannt als [Ticket #204 - The Inkscape default units quandary](https://github.com/freesewing/core/issues/204), geschrieben.

Ich werde nicht noch einmal über [all das](/blog/roundup-2017-12/) gehen, aber es läuft darauf hinaus, dass die [Inkscape](http://inkscape.org/) Maintainer Inkscape's internes DPI (dots per inch) von 90 auf 96 geändert haben. Eine Änderung, die ab der Version 0.92 wirksam wird.

Wenn diese Änderung nicht korrekt berücksichtigt wird, würde dies dazu führen, dass alle FreeSewing-Schnittmuster falsch skaliert werden. Das liegt daran, dass wir 90DPI in unserer SVG-Ausgabe annehmen und dementsprechend skalieren.

![That 'oh-shit' moment when we realized the full impact of the DPI change](oh-shit.gif)

Wenn der Wechsel zu 96DPI in Kraft tritt, würden alle Muster um 6,66 % zu klein ausgegeben. Das ist wirklich die Art von Unterschied, der zu klein ist, um ihn beim in Augenschein nehmen eines Schnittmuster zu bemerken, aber dennoch groß genug, um Ihr Kleidungsstück komplett zu verunstalten.

Das Problem ist auch problematischer, als es an der Oberfläche scheint. Erstens, weil wir nicht einfach auf 96DPI umsteigen können, da es jetzt zwei Versionen gibt, die ein anderes Standard-DPI unter der Haube verwenden. Wir brauchen eine Lösung, die für beide funktioniert.

![Screenshot of a freesewing pattern that is incorrectly scaled in the latest Inkscape release](inkscape.png)

Darüber hinaus würde jede Korrektur, die wir implementieren, für neue Entwürfe gelten, alle existierenden Entwürfe, die vor der Korrektur erstellt wurden, jedoch würden beeinträchtigt werden.

Mit anderen Worten, wenn Sie letzte Woche oder vor einem Monat ein Schnittmuster erstellt haben, würde dieses Muster in einer aktuellen Version von Inkscape nicht korrekt skaliert werden. Und da wir Inkscape in unserer SVG-zu-PDF-Toolkette verwenden, würde es auch falsch skaliert sein, wenn Sie hierher kommen und ein PDF herunterladen.

Natürlich musste etwas getan werden. Und zwar schnell.

## Die Korrektur für neue Entwürfe

Seit der heutigen Veröffentlichung von Core v1.3.0 sind unsere SVG-Dateien nicht mehr von einer DPI-Einstellung abhängig.

Anstatt die internen Einheiten zu verwenden und eine SVG-Transformation anzuwenden, um das gesamte Muster zu skalieren, haben wir die Einheiten auf mm fixiert und die SVG viewBox aktualisiert, um die Skalierung anzuwenden.

Natürlich hätten wir das von Anfang an tun sollen. Man hat nie ausgelernt.

Wenn Sie sich Sorgen über die Verwendung von mm in Ihrem Entwurf machen (weil Sie an imperiale Einheiten gewöhnt sind), seien Sie versichert, dass diese mm unter der Haube bleiben werden. Sie werden nicht in der Lage sein, den Unterschied festzustellen.

## Die Korrektur für bereits vorhandene Entwürfe

Um Probleme mit bereits bestehenden Entwürfen zu vermeiden, mussten wir auch dafür eine Lösung finden.

Wir haben im Wesentlichen zwei Möglichkeiten:

 - Alle Entwürfe neu erstellen
 - Patch them in-place without changing the draft itself

Re-drafting fixes the issue as every new draft will be handled by the latest core version that does include the fix.

However, core also ships with regular updates, tweaks, and fixes in the patterns themselves. So by re-drafting a draft generated on a previous version of core, there's no guarantee the draft won't change.

In principle that change would always be an improvement. But one person's bug is another person's feature, and we do prefer not to [move your cheese](https://en.wikipedia.org/wiki/Who_Moved_My_Cheese%3F).

![Don't touch my stuff](who-moved-my-cheese.jpg)

So, instead we decided to patch all drafts we have on file in-place with the new scaling code, without touching any other aspect of the draft.

As you're reading this, this has already been done, and all freesewing drafts should now scale correctly. Everywhere.

## Also: version awareness

We've also made changes to our backend systems to store the version of freesewing core that generated your draft.

If since you generated your draft we've rolled out new features or fixes, you'll be notified that an update is available:

![If you draft is generated with an old version of freesewing core, we'll tell you about it](upgrade.png)

Whether you update your draft or not is up to you. If you don't want to loose the info in your *old* draft, rather than update it in-place, you can fork it.

