CREATE SEQUENCE seq_medecins ;

ALTER TABLE medecins 
 ADD (numero Number(10)) ;

-- Affectation de valeurs dans la nouvelle PK
UPDATE medecins 
 SET numero = seq_medecins.Nextval;

ALTER TABLE medecins 
  ADD (matr_str Varchar(10) CONSTRAINT uk_medecins_matr_str UNIQUE) ;

UPDATE medecins 
  SET matr_str = 'CH' || To_Char(matricule) ;

-- Doit etre fait apres la reprise des valeurs
ALTER TABLE medecins 
  MODIFY matr_str Varchar(10) CONSTRAINT nn_medecins_matr_str NOT NULL ;

--Doit etre supprimee pour pouvoir detruire la PK de medecins
ALTER TABLE consultations
 DROP CONSTRAINT consultations_medecins_fk ;

ALTER TABLE medecins
  DROP CONSTRAINT pk_medecins ;

ALTER TABLE consultations  ADD (num_medecin Number(10) ) ;

UPDATE consultations c
 SET num_medecin = (SELECT m.numero 
                      FROM medecins m 
					 WHERE m.matricule = c.matricule) ;

ALTER TABLE consultations  DROP COLUMN matricule ;

ALTER TABLE medecins  DROP COLUMN matricule ;

ALTER TABLE medecins  
  ADD CONSTRAINT pk_medecins PRIMARY KEY (numero) ;

ALTER TABLE consultations
 ADD CONSTRAINT fk_consultations_medecins
   FOREIGN KEY (num_medecin)
    REFERENCES medecins ;