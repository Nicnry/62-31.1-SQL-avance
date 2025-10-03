SELECT Level AS niveau, Lpad(' ', Level) || code AS noeud, libelle fonction
FROM fonctions
WHERE Level = 
CONNECT BY PRIOR numero = num_fonction_mere 
START WITH num_fonction_mere = 'RINF';