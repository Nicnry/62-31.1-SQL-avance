# Notes
Une arbre à un seul père (root) sinon c'est une racine. Le père possède forcément une relation sur NULL (utile pour connaitre le `START WITH column IS NULL`)
Les noeuds sont des Nodes, ils ne connaissent pas leurs enfants.

## Comment se balader
Définir un noeud de départ (`START WITH`) et y définir le sens de parcours (`CONNECT BY`) et PRIOR.
Le `PRIOR` définit le sens (avant le égal, de haut en bas, après le égal, de bas en haut)

## Connaissance de la profondeur 
la pseudo-colonne `LEVEL` est relative au node de départ, il peut être récupéré dans la clause `WHERE` et la fonction `Lpad(string, colonne)` retourne une chaine formée de la concat du premier paramètre mais n'a pas d'influence sur le parcours

### WHERE
`WHERE` n'impacte pas le parcours, il est effectué après même si dans la syntaxe on l'appelle avant (avant le `CONNECT BY`)

### ORDER BY
Le parcours n'impacte pas le parcours mais le resultat est ordonné en fonction de la fonction

## Fonctions utiles
Avec `CONNECT_BY_ROOT` ou `SYS_CONNECT_BY_PATH(column, string=separator)`

```sql
SELECT CONNECT_BY_ROOT valeur AS ancetre,
    valeur AS noeud,
    Level -1 AS distance,
    SYS_CONNECT_BY_PATH(valeur, '/') AS chemin
FROM arbre
WHERE Level > 1
CONNECT BY PRIOR id = id_pere
ORDER BY ancetre, noeud;
```

### `CONNECT_BY_ISLEAF`
Permet de savoir si node est une leaf
```sql
SELECT Level AS niveau,
    LPad(' ',Level) || valeur AS contenu,
    CONNECT_BY_ISLEAF AS feuille
FROM arbre
CONNECT BY PRIOR id = id_pere
START WITH id_pere is Null ;
```

### `ORDER SIBLINGS BY`
Permet de filtrer par niveau (Si je veux les mettre par ordre ASC ou DESC) je peux ainsi modifier mon affichage.

## Cycles
Recursivité d'un noeud qui apparaît 2 fois dans le parcours.
La fonction `CONNECT_BY_ISCYCLE` avec un `CONNECT BY NOCYCLE` affiche que le noeud a été cyclé une 2ème fois.

## Jointure avec parcours d'arbre
On doit commencer par la jointure et ensuite le parcours de l'arbre