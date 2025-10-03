# Série 3
1. Création d’un arbre
Ajouter une colonne NUM_FONCTION_MERE dans votre table FONCTIONS pour permettre de les
hiérarchiser
Assurez-vous que la structure de l’arbre soit cohérente (contraintes).
2. Peuplement de l’arborescence
Peupler les clés étrangères pour obtenir une arborescence plausible.
Exemple :

| CODE_FONCTION | CODE_RESPONSABLE |
|---------------|------------------|
| DIR           |                  |
| RFIN          | DIR              |
| CPT           | RFIN             |
| CTR           | RFIN             |
| RINF          | DIR              |
| DBA           | RINF             |
| DEV           | RINF             |
| ARCH          | RINF             |
| SDIR          | DIR              |
| SEC           | SDIR             |
| ASS           | SDIR             |
Démarche conseillée :
- Dessiner l’» organigramme » (papier/crayon) des fonctions que vous souhaitez mettre en
place (ou reprendre celle de l’exemple)
- Exécuter les commandes SQL nécessaire pour mettre à jour les données
3. Visualisation de l’arbre
Visualiser toutes les fonctions en partant de l’ancêtre, en mentionnant leur niveau dans la
hiérarchie. L’indentation de l’affichage du libellé en fonction du niveau est souhaitée, mais pas
nécessaire.
4. Visualisation d’une portion de l’arbre
Visualiser le niveau et le nom des fonctions qui dépendent de la fonction du responsable
informatique (RINF).
5. Recherche d’ancêtre, avec contrôle de niveau
Quel est la fonction directement supérieure au Comptable (CPT)
6. Recherche par niveau
Quelles sont les fonctions de même niveau que la fonction Contrôleur ?
7. Recherche des feuilles
Quelles sont les fonctions du bas de la hiérarchie ? (Celles qui n’ont pas de fonctions enfants)
62-31.1 SQL Avancé
Série 3
62-31.1_Serie3.docx 2/2
8. Organigramme de l’entreprise
Visualiser l’organigramme de l’entreprise, soit les fonctions hiérarchisées et les noms des
collaborateurs.
Si vous n’avez pas modifiés les données de base et que vous avez reproduit l’arborescence des
fonctions de l’exercice 2, vous obtiendrez ceci : 