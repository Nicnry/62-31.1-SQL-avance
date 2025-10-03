UPDATE fonctions SET num_fonction_mere = 11 WHERE numero IN (10, 3, 4);
COMMIT;
UPDATE fonctions SET num_fonction_mere = 3 WHERE numero IN (2, 1);
COMMIT;
UPDATE fonctions SET num_fonction_mere = 4 WHERE numero IN (5, 6, 7 );
COMMIT;
UPDATE fonctions SET num_fonction_mere = 10 WHERE numero IN (8, 9 );
COMMIT;