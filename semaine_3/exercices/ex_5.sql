SELECT Level AS niveau, Lpad(' ', Level) || code AS noeud, libelle fonction
FROM fonctions
WHERE Level = 2
CONNECT BY numero = PRIOR num_fonction_mere 
START WITH code = 'CPT';