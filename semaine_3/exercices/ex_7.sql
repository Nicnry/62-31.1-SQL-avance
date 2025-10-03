SELECT Level AS niveau, Lpad(' ', Level) || code AS noeud, libelle fonction, CONNECT_BY_ISLEAF AS feuille
FROM fonctions
WHERE CONNECT_BY_ISLEAF = 1
CONNECT BY PRIOR numero = num_fonction_mere 
START WITH num_fonction_mere IS NULL;