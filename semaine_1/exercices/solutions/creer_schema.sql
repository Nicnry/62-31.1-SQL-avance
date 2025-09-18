-- Schema modifications de schema 62-31.1 SQL Avancé
CREATE TABLE medecins ( 
     matricule Number (10) CONSTRAINT PK_medecins PRIMARY KEY, 
	 nom Varchar(20),
     titre Varchar (20) );

CREATE TABLE patients ( 
	 num_assure Number(10) CONSTRAINT PK_patients PRIMARY KEY, 
	 nom Varchar(20),
	 prenom Varchar(20) );

CREATE SEQUENCE seq_consultations ;
CREATE TABLE consultations ( 
     numero Number (10) DEFAULT seq_consultations.Nextval 
	   CONSTRAINT PK_consultations PRIMARY KEY, 
     date_consult Date,
	 type_consult Char(1),
	 prix Number(4),
	 matricule Number (10),
	 num_assure Number(10) );


CREATE SEQUENCE seq_medicaments ;

CREATE TABLE medicaments ( 
	 numero Number(10) DEFAULT seq_medicaments.Nextval
 	   CONSTRAINT PK_medicaments PRIMARY KEY,
	 code Varchar(10),
	 CONSTRAINT uk_medicaments_code UNIQUE(code), 
	 nom VARCHAR2(50),
	 prix NUMBER(5,2) );

CREATE TABLE prescriptions ( 
	 num_medicament Number(10),
	 num_consult    Number(10),
	 posologie      Number(3) ,
	   CONSTRAINT pk_prescriptions PRIMARY KEY (num_medicament,num_consult));
	   
ALTER TABLE prescriptions 
  ADD CONSTRAINT fk_prescriptions_medicaments 
	     FOREIGN KEY (num_medicament)
		   REFERENCES medicaments ;	   
ALTER TABLE prescriptions 
  ADD CONSTRAINT fk_prescriptions_consultations
	     FOREIGN KEY (num_consult)
		   REFERENCES consultations );
ALTER TABLE consultations 
  ADD CONSTRAINT FK_consultations_matricule 
    FOREIGN KEY (matricule) REFERENCES medecins;

ALTER TABLE consultations 
  ADD CONSTRAINT FK_consultations_num_assure 
	FOREIGN KEY (num_assure) REFERENCES patients;	