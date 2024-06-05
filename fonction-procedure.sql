CREATE OR REPLACE FUNCTION calcul_points_semaine(idUtilisateur INT, pointsGagnes IN OUT INT, pointsPerdus IN OUT INT)
RETURN INT
IS
BEGIN    
    --Nombre de tâches terminées cette semaine 
    SELECT COUNT(*) INTO pointsGagnes
    FROM Tache 
    WHERE idRealisateur = idUtilisateur AND statut = 1
        AND idTache IN (SELECT idTache FROM Assignation WHERE idUser = idUtilisateur)
        AND dateAccomplie BETWEEN TRUNC(SYSDATE, 'IW') AND TRUNC(SYSDATE, 'IW') + 6; -- date accomplie entre lundi de cette semaine et dimanche de cette semaine

    --Nombre de tâches non terminées cette semaine 
    SELECT COUNT(*) INTO pointsPerdus
    FROM Tache
    WHERE idTache IN (SELECT idTache FROM Assignation WHERE idUser = idUtilisateur)  
        AND (
                (statut = 0 AND idRealisateur IS NULL AND dateEcheance BETWEEN TRUNC(SYSDATE,'IW') AND TRUNC(SYSDATE, 'IW') + 6)  -- date d'échéance passée et tâche non réalisée
                OR 
                (statut = 1 AND idRealisateur IS NOT NULL AND idRealisateur <> idUtilisateur AND dateAccomplie BETWEEN TRUNC(SYSDATE,'IW') AND TRUNC(SYSDATE, 'IW') + 6) --tâche réalisée par un autre utilisateur
            ); 
            
    RETURN pointsGagnes - pointsPerdus; --renvoie le score
    
    END;
/

DECLARE
    CURSOR utilisateurs_cur IS SELECT idUser FROM Utilisateur;
    idUtilisateur INT;
    pointsGagnes INT;
    pointsPerdus INT;
    score INT;
BEGIN
    FOR utilisateur_rec IN utilisateurs_cur LOOP
   
        idUtilisateur := utilisateur_rec.idUser;

        score := calcul_points_semaine(idUtilisateur, pointsGagnes, pointsPerdus);
      
        DBMS_OUTPUT.PUT_LINE('Utilisateur '|| idUtilisateur ||' -> points gagnés : ' || pointsGagnes || ', points perdus : ' || pointsPerdus || ', score : '|| score);
   END LOOP;
END;
/

--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE archiver_taches_passees
IS 
    CURSOR tache_passee_curs IS SELECT * FROM Tache_Passee;
BEGIN
   FOR tache_passee IN tache_passee_curs
   LOOP
        DBMS_OUTPUT.PUT_LINE('Tache passée qui va être archivée : idTache = ' || tache_passee.idTache ||', intitulé = ' || tache_passee.intitule);
        
        -- Suppression des dépendances associées à la tâche
        DELETE FROM Dependances WHERE idTacheParent = tache_passee.idTache OR idTacheEnfant = tache_passee.idTache;
        DELETE FROM Assignation WHERE idTache = tache_passee.idTache;
        
        --Rechercher la tâche passée dans Tache et l'insérer dans Tache_Archivee     
        INSERT INTO Tache_Archivee
        SELECT * FROM Tache WHERE idTache = tache_passee.idTache;
        
        -- -- Suppression de la tâche passée des tables Tache_Passee et Tache
        DELETE FROM Tache_Passee WHERE idTache = tache_passee.idTache;
        DELETE FROM Tache WHERE idTache = tache_passee.idTache;
        
    END LOOP;
END;
/

BEGIN
    archiver_taches_passees;
END;
/