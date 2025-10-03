SELECT Level AS niveau, Lpad(' ', Level) || code AS noeud, libelle fonction
FROM fonctions 
CONNECT BY PRIOR numero = num_fonction_mere 
START WITH num_fonction_mere is Null;
