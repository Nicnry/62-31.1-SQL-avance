SELECT Lpad(' ', Level) || f.code AS fonction, e.nom || ' ' || e.prenom employe
FROM fonctions f
LEFT OUTER JOIN contrats c ON f.numero = c.num_fonction
  INNER JOIN employes e ON c.num_employe = e.numero
CONNECT BY PRIOR f.numero = f.num_fonction_mere 
START WITH f.num_fonction_mere IS NULL;