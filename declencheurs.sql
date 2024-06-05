--------------------------------------------------------------------------------------------------
-- Triggers pour déplacements des tâches :
--------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER tache_after_insert
AFTER INSERT ON Tache
FOR EACH ROW
BEGIN
  IF :new.statut = 1 OR :new.dateEcheance < SYSDATE OR :new.dateFin < SYSDATE THEN
    INSERT INTO Tache_Passee (idTache, idCreateur, intitule, dateAccomplie) --Insertion dans Tache_Passee
    VALUES (:new.idTache, :new.idCreateur, :new.intitule, :new.dateAccomplie);
  ELSIF (:new.statut = 0 AND :new.dateEcheance > SYSDATE) OR (:new.statut = 0 AND :new.dateFin > SYSDATE) THEN
    INSERT INTO Tache_A_Realiser (idTache, idCreateur, intitule)
    VALUES (:new.idTache, :new.idCreateur, :new.intitule);
  END IF;
END;
/
ALTER TRIGGER tache_after_insert ENABLE;

CREATE OR REPLACE TRIGGER tache_update_idrealisateur
AFTER UPDATE ON Tache
FOR EACH ROW
BEGIN
  IF :new.statut = 1 AND :old.statut = 0 THEN
    UPDATE Tache
    SET idRealisateur = :new.idCreateur
    WHERE idTache = :new.idTache;
  END IF;
END;
/
ALTER TRIGGER tache_update_idrealisateur ENABLE;


CREATE OR REPLACE TRIGGER tache_after_update
AFTER UPDATE ON Tache
FOR EACH ROW
BEGIN
    -- Si le statut est passé de 0 à 1, mettre à jour dateAccomplie dans Tache_Passee
    IF :new.statut = 1 AND :old.statut = 0 THEN
        UPDATE Tache_Passee
        SET dateAccomplie = SYSDATE
        WHERE idTache = :new.idTache AND idCreateur = :new.idCreateur;
    END IF;
    
    IF (:new.statut = 1 OR :new.dateEcheance < SYSDATE OR :new.dateFin < SYSDATE) AND
        (:old.statut != 1 AND :old.dateEcheance >= SYSDATE AND :old.dateFin >= SYSDATE) THEN
        INSERT INTO Tache_Passee (idTache, idCreateur, intitule)
        VALUES (:new.idTache, :new.idCreateur, :new.intitule);
        DELETE FROM Tache_A_Realiser
        WHERE idTache = :new.idTache AND idCreateur = :new.idCreateur;
    
    --si on rajoute du temps pour finir la tâche, on la déplace vers Tache_A_Realiser
    ELSIF :new.statut = 0 AND :new.dateFin > SYSDATE AND
     (:old.statut = 1 OR :old.dateEcheance < SYSDATE OR :old.dateFin < SYSDATE) THEN
        INSERT INTO Tache_A_Realiser (idTache, idCreateur, intitule)
        VALUES (:new.idTache, :new.idCreateur, :new.intitule);
        DELETE FROM Tache_Passee
        WHERE idTache = :new.idTache AND idCreateur = :new.idCreateur;
    END IF;
END;
/
ALTER TRIGGER tache_after_update ENABLE;

--------------------------------------------------------------------------------
-- Triggers demandés dans la partie 2 :
--------------------------------------------------------------------------------
SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER mise_a_jour_score
AFTER INSERT OR UPDATE ON Tache
FOR EACH ROW
DECLARE
    point INT;
BEGIN 
    IF :NEW.statut = 1 AND :NEW.dateAccomplie < :NEW.dateEcheance
        THEN point := 1;
    ELSIF 
        :NEW.statut = 0 AND :NEW.dateEcheance < SYSDATE
        THEN point := -1;
    ELSE
        point := 0;
    END IF;
    
    -- Mettre à jour le score de l'utilisateur dans la table Utilisateur
    UPDATE Utilisateur
    SET score = score + point
    WHERE idUser = :NEW.idRealisateur;
END;
/

CREATE OR REPLACE TRIGGER taches_associees_aux_taches_periodiques
BEFORE INSERT OR UPDATE ON Tache
FOR EACH ROW
DECLARE
    dateDebut DATE;
    dateFin DATE;
    periode VARCHAR(8); --jour, semaine ou mois
    joursPeriode INT;
    nbrJours INT;
    nbrTachesAssocieesACreer INT;
BEGIN
    --Vérifier si la tâche est périodique
    IF :NEW.estPeriodique = 1 AND :NEW.statut = 0 THEN
        dateDebut := :NEW.dateDebut;
        dateFin := :NEW.dateFin;
        nbrJours := dateFin - dateDebut;
        periode := :NEW.periode;
        
        CASE periode
            WHEN 'jour' THEN joursPeriode := 1;
            WHEN 'semaine' THEN joursPeriode := 7;
            WHEN 'mois' THEN joursPeriode := EXTRACT(DAY FROM LAST_DAY(dateDebut - INTERVAL '1' MONTH));
            ELSE joursPeriode := 1;
        END CASE;
        
        nbrTachesAssocieesACreer := TRUNC(nbrJours / joursPeriode);
        
        FOR I IN 0..nbrTachesAssocieesACreer LOOP
            IF :NEW.periode = 'jour' THEN
                INSERT INTO Tache(intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)
                    VALUES(
                            :NEW.intitule,
                            :NEW.description,
                            :NEW.categorie,
                            :NEW.dateDebut + i, --date de début = le jour même
                            :NEW.dateDebut + i, --date de fin = le jour même
                            :NEW.priorite,
                            :NEW.statut,
                            :NEW.lienExterne,
                            0,
                            NULL,
                            :NEW.dateDebut + i, --date d'échéance = le jour même
                            :NEW.idCreateur,
                            :NEW.idProjet,
                            :NEW.idListeTache,
                            :NEW.idRealisateur,
                            :NEW.dateAccomplie
                        );
                        
            ELSIF :NEW.periode = 'semaine' THEN
                INSERT INTO Tache(intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)
                    VALUES(
                            :NEW.intitule,
                            :NEW.description,
                            :NEW.categorie,
                            :NEW.dateDebut + (i*7),
                            :NEW.dateDebut + (i*7) + 6,
                            :NEW.priorite,
                            :NEW.statut,
                            :NEW.lienExterne,
                            0,
                            NULL,
                            :NEW.dateDebut + (i*7) + 6,
                            :NEW.idCreateur,
                            :NEW.idProjet,
                            :NEW.idListeTache,
                            :NEW.idRealisateur,
                            :NEW.dateAccomplie
                        );
            ELSIF :NEW.periode = 'mois' THEN
                INSERT INTO Tache(intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)
                    VALUES(
                            :NEW.intitule,
                            :NEW.description,
                            :NEW.categorie,
                            ADD_MONTHS(dateDebut, i), -- Ajouter i mois à la date de début
                            ADD_MONTHS(dateDebut, i + 1) - 1,
                            :NEW.priorite,
                            :NEW.statut,
                            :NEW.lienExterne,
                            0,
                            NULL,
                            ADD_MONTHS(dateDebut, i + 1) - 1,
                            :NEW.idCreateur,
                            :NEW.idProjet,
                            :NEW.idListeTache,
                            :NEW.idRealisateur,
                            :NEW.dateAccomplie
                        );
            END IF;                        
        END LOOP;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_statut_tache_periodique
BEFORE INSERT OR UPDATE ON Tache
FOR EACH ROW
DECLARE
    totalSousTaches INT;
    totalSousTachesEffectuees INT;
BEGIN
    IF :NEW.estPeriodique = 1 THEN
        -- Compter le nombre total de "sous-tâches"
        SELECT COUNT(*)
        INTO totalSousTaches
        FROM Tache
        WHERE idTache = :NEW.idTache;
    
        -- Compter le nombre total de "sous-tâches" effectuées
        SELECT COUNT(*)
        INTO totalSousTachesEffectuees
        FROM Tache
        WHERE idTache = :NEW.idTache AND statut = 1;
    
        -- Mettre à jour le statut de la tâche périodique 
        IF totalSousTaches = totalSousTachesEffectuees THEN
            UPDATE Tache
            SET statut = 1
            WHERE idTache = :NEW.idTache;
        
        --si on tente de mettre le statut à 1 de la tâche périodique alors que ses sous-tâches sont non terminées alors erreur
        ELSIF :NEW.statut = 1 AND totalSousTaches <> totalSousTachesEffectuees THEN
            RAISE_APPLICATION_ERROR(-20001, 'Toutes les sous-tâches doivent avoir le statut 1 pour mettre le statut de la tâche "mère" à 1');
        END IF;
    END IF;
END;
/




