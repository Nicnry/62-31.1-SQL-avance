# Résumé

- Une base de données représente un système vivant
- Il est donc fréquent (et normal) de devoir modifier sa structure
- Les structures (tables) contiennent des données qui ne peuvent être perdues
    - Mise à jour de la base de production !!

## Commandes utiles
CRUD classique : 
```SQL
CREATE TABLE
SELECT
ALTER TABLE
DROP TABLE
```

### ALTER TABLE

> - Ajout de nouvelles colonnes<br>
> - Ajout de nouvelles contraintes

```SQL
ALTER TABLE nomTable
ADD ( 
    colonne type [colonne_constraint]
    [, colonne type [colonne_constraint]]
    [, table_constraint]
    [, ...]
);
```

> – Ajout d’une contrainte sur une colonne existante

```SQL
ALTER TABLE nomTable
MODIFY ( 
    colonne type [colonne_constraint]
    [, colonne type [colonne_constraint]]
    [, ...]
);
```

> - Suppression d’une colonne

```SQL
ALTER TABLE nomTable DROP COLUMN colonne [, colonne ] …;
```

> - Suppression d’une contrainte

```SQL
ALTER TABLE nomTable DROP CONSTRAINT constraint_name;
```

### DROP TABLE
```SQL
DROP TABLE nomTable [ CASCADE CONSTRAINTS ] ;
```

## Contraintes colonnes vs tables
Les contraintes peuvent être placées au niveau de la colonne ou de la table.

⚠️ Certains types de contraintes peuvent être placées uniquement en contrainte de colonnes ou uniquement en contraintes de table

d’autres peuvent être définies en contrainte de table ou de colonne
- On ne peut placer qu’**une** contrainte de colonne par colonne
- On peut placer **plusieurs** contraintes de tables sur une table
- ❗ Il faut nommer les contraintes

- Il faut modifier la colonne pour ajouter/supprimer une contrainte NOT NULL
- En pratique, on «réserve» la contrainte de colonne pour les NOT NULL, les autres seront placées en contrainte de table


| Contrainte  | Description                                                                                                                             | Colonne | Table |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------|-------|
| Primary Key | Une combinaison de NOT NULL et  UNIQUE. Définit une clé primaire pour identifier de manière unique chaque ligne dans une table.         | ✅       | ❌     |
| Foreign Key | Définit une contrainte de clé étrangère qui établit une relation entre deux tables.                                                     | ✅       | ❌     |
| NOT NULL    | Empêche une colonne d’accepter des valeurs NULL. On reserve en priorité cette contrainte pour la colonne.                               | ✅       | ❌     |
| Default     | Définit une valeur par défaut pour une colonne, si aucune valeur n'est précisée.                                                        | ✅       | ❌     |
| Cascade     | Permet de définir des actions automatiques sur les enregistrements liés en cas de modification ou suppression (ex : ON DELETE CASCADE). | ❌       | ✅     |
| Index       | Crée un index sur une ou plusieurs colonnes pour accélérer les requêtes.                                                                | ❌       | ✅     |
| Constraint  | Permet de donner un nom spécifique à une contrainte, appliquée sur une colonne ou une table.                                            | ✅       | ✅     |
| Unique      | Garantit que chaque valeur dans la colonne est unique.                                                                                  | ✅       | ❌     |

### Primary Key (PK)
Une seule par table
On ne peut pas supprimer une PK qui est référencée par une FK


### Foreign Key (FK)
Applique une liaison père-fils sur les tables (Clé primaire, Clé étrangère)

> [!IMPORTANT]
> On ne peut pas créer une FK si il n’existe pas une PK à référencer (Un enfant à nécessairement un parent...)
