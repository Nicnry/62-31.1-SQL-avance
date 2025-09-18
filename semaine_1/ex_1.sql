CREATE TABLE medecins (
    matricule Number(10) CONSTRAINT PK_medecins PRIMARY KEY,
    nom VARCHAR2(20),
    titre VARCHAR(20)
);

CREATE TABLE patients (
    num_assure Number(10) CONSTRAINT PK_patients PRIMARY KEY,
    nom VARCHAR2(20),
    prenom VARCHAR(20)
);

CREATE SEQUENCE seq_consulatation;
CREATE TABLE consultations (
    numero Number(10) DEFAULT seq_consulatation.Nextval CONSTRAINT PK_consultations PRIMARY KEY,
    date_consult DATE,
    type_consult CHAR(1),
    prix Number(4),
    matricule Number(10),
    num_assure Number(10),
    CONSTRAINT FK_consultations_matricule FOREIGN KEY (matricule) REFERENCES medecins,
    CONSTRAINT FK_consultations_num_assure FOREIGN KEY (num_assure) REFERENCES patients
);

CREATE SEQUENCE seq_medicaments;
CREATE TABLE medicaments (
    numero Number(10) DEFAULT seq_medicaments.Nextval CONSTRAINT PK_medicaments PRIMARY KEY,
    code VARCHAR2(10) CONSTRAINT uk_medicaments_code UNIQUE,
    nom VARCHAR(50),
    prix Number(5,2)
);

CREATE TABLE prescriptions (
    num_medicament Number(10),
    num_consult Number(10),
    posologie Number(3),
    CONSTRAINT PK_prescriptions PRIMARY KEY (num_medicament, num_consult),
    CONSTRAINT FK_prescriptions_consultations FOREIGN KEY (num_consult) REFERENCES consultations,
    CONSTRAINT FK_prescriptions_medicaments FOREIGN KEY (num_medicament) REFERENCES medicaments
);
