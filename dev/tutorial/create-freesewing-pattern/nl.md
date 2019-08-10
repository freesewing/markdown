---
title: De development-omgeving opzetten
order: 100
---

Open een terminal en voer de volgende opdracht in:

```bash
npm init freesewing-pattern@beta
```

<note>

De `@beta`-suffix is nodig zolang FreeSewing 2.0 in beta is.

</Note>

Deze opdracht laadt een aantal dependencies en stelt je dan de volgende vragen:

- **Language**: Gebruik de pijltoetsen om de taal van jouw keuze in te stellen
- **Pattern name**: Voer `tutorial` in 
- **Description**: Voer `The FreeSewing tutorial` in
- **Pattern type**: Gebruik de pijltoetsen om `Pattern` te selecteren
- **Department**: Gebruik de pijltoetsen om `Accessories` te selecteren
- **Author**: Voer je GitHub-gebruikersnaam in
- **GitHub repository**: Dit staat automatisch ingevuld, dus tik gewoon Enter
- **Package manager**: Gebruik het pijltje om te kiezen. Kies `NPM` als je het niet zeker weet.

Nadat je deze vragen beantwoord hebt, wordt er een standaardtemplate gekopieerd. Daarna worden alle dependencies geïnstalleerd.

<note>

Dit duurt een paar minuten aangezien we software voor je development-omgeving aan het laden zijn.

</Note>

Als het klaar is, moet je twee opdrachten parallel invoeren. In de huidige terminal geef je de directory in die we net gemaakt hebben voor het `tutorial`-patroon en begin rollup in de volgmodus:

```bash
cd tutorial
npm run start
```

Of als je Yarn gekozen hebt als package manager:

```bash
cd tutorial
yarn start
```

Open nu een tweede terminal en navigeer naar de subfolder `example`. Voer daar dezelfde opdracht in:

<pre><code class="bash:">cd tutorial/example
npm run start
</code></pre>

Of als je Yarn gekozen hebt als package manager:

```bash
cd tutorial/example
yarn start
```

Als alles goed gaat, gaat je browser nu open met de volgende landingspagina:

![De development-omgeving van FreeSewing](./cfp.png)

<note>

###### Ben je een Windows-gebruiker?

We hebben dit getest op Linux en MacOS, maar nog niet op Windows.

Als je problemen ondervindt, gooi ze dan in [onze chatroom](https://gitter.im/freesewing/freesewing) en we gaan samen op zoek naar oplossingen.

</Note>