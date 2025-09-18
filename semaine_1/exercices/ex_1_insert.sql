INSERT INTO medecins (matricule, nom, titre) VALUES (187267, 'Dupont', 'Dr');
INSERT INTO medecins (matricule, nom, titre) VALUES (173912, 'Martin', 'Dr');
INSERT INTO medecins (matricule, nom, titre) VALUES (831319, 'Lemoine', 'Pr');

COMMIT;

INSERT INTO patients (num_assure, nom, prenom) VALUES (1001, 'Lemoine', 'Pierre');
INSERT INTO patients (num_assure, nom, prenom) VALUES (1002, 'Durand', 'Sophie');
INSERT INTO patients (num_assure, nom, prenom) VALUES (1003, 'Dupuis', 'Claire');
COMMIT;

INSERT INTO consultations (numero, date_consult, type_consult, prix, matricule, num_assure) VALUES (NICOLAS_HENRY.SEQ_CONSULATATION.NEXTVAL, TO_DATE('2025-09-18', 'YYYY-MM-DD'), 'G', 50, 1, 1001);
INSERT INTO consultations (numero, date_consult, type_consult, prix, matricule, num_assure) VALUES (NICOLAS_HENRY.SEQ_CONSULATATION.NEXTVAL, TO_DATE('2025-09-17', 'YYYY-MM-DD'), 'P', 70, 2, 1002);
INSERT INTO consultations (numero, date_consult, type_consult, prix, matricule, num_assure) VALUES (NICOLAS_HENRY.SEQ_CONSULATATION.NEXTVAL, TO_DATE('2025-09-16', 'YYYY-MM-DD'), 'G', 60, 3, 1003);
COMMIT;

INSERT INTO medicaments (code, nom, prix) VALUES ('M001', 'Paracétamol', 3.50);
INSERT INTO medicaments (code, nom, prix) VALUES ('M002', 'Ibuprofène', 4.00);
INSERT INTO medicaments (code, nom, prix) VALUES ('M003', 'Amoxicilline', 5.50);

INSERT INTO prescriptions (num_medicament, num_consult, posologie) VALUES (1, 1, 2);

INSERT INTO prescriptions (num_medicament, num_consult, posologie) VALUES (2, 2, 1);

INSERT INTO prescriptions (num_medicament, num_consult, posologie) VALUES (3, 3, 3);

COMMIT;