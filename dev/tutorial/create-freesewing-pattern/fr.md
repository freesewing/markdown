---
title: Paramétrer l'environnement de développement
order: 100
---

Ouvrez un terminal et entrez la commande suivante :

```bash
npm init freesewing-pattern@beta
```

<note>

Le suffixe `@beta` est requis tant que FreeSewing 2.0 est en beta.

</Note>

Cela va charger quelques dépendances, puis vous demander les questions suivantes :

- **Language</strong (Langage) >: Utilisez les flèches directionnelles pour sélectionner le langage de votre choix</li> 
    
    - **Pattern name (Nom du patron)**: Entrez `tutorial` (pour tutoriel) 
    - **description**: Entrez `The FreeSewing tutorial` (le tutoriel Freesewing)
    - **Pattern type (Type de patron)**: Utilisez les flèches directionnelles pour sélectionner `Pattern` (pour patron)
    - **Department (Département)**: Utilisez les flèches directionnelles pour sélectionner `Accessories` (pour Accessoires)
    - **Author (Auteur)**: Entrez votre nom d'utilisateur GitHub
    - **GitHub repository (Dépôt Github)**: Cela sera pré-rempli pour vous, alors cliquez juste sur Entrée
    - **Package manager (Gestionnaire de package)**: Utilisez la flèche pour choisir. En cas de doute, prenez `NPM`.</ul> 
    
    Après avoir répondu à toutes ces questions, le modèle par défaut sera copié, après quoi toutes les dépendances seront installées.
    
    <note>
    
    Cela prendra quelques minutes car nous chargeons des logiciels pour votre environnement de développement.
    
    </Note>
    
    Lorsque c'est prêt, vous devrez exécuter deux commandes en parallèle. Dans le terminal courant, entrez le répertoire qui vient d'être créé pour notre patron `tutorial` et démarrez rollup en mode veille :
    
    ```bash
    cd tutorial
    npm run start
    ```
    
    Or if you chose to use Yarn as package manager:
    
    ```bash
    cd tutorial
    yarn start
    ```
    
    Now open a second terminal, and navigate to the `example` subfolder and run the same command there:
    
    <pre><code class="bash:">cd tutorial/example
npm run start
</code></pre>
    
    Or if you chose to use Yarn as package manager:
    
    ```bash
    cd tutorial/example
    yarn start
    ```
    
    If all goes well, your browser will open and show the following landing page:
    
    ![The FreeSewing development environment](./cfp.png)
    
    <note>
    
    ###### Using Windows?
    
    We have tested this on Linux and MacOS, but not on Windows since I (joost) don't have a Windows machine I can test this on.
    
    If you run into any issues, join [our chatroom](https://gitter.im/freesewing/freesewing) and we'll figure it out together.
    
    </Note>