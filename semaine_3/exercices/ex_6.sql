SELECT Level AS niveau, Lpad(' ', Level) || code AS noeud, libelle fonction
FROM fonctions
WHERE Level = (
    SELECT Level AS niveau 
    FROM fonctions
    WHERE code = 'CPT'
    CONNECT BY PRIOR numero = num_fonction_mere 
    START WITH num_fonction_mere IS NULL
)
CONNECT BY PRIOR numero = num_fonction_mere 
START WITH num_fonction_mere IS NULL;