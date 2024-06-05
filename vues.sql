--------------------------------------------------------------------------------------------------
-- Créations de vues :
--------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW Vue_Taches_Par_Priorite AS
SELECT idTache, intitule, description, priorite
FROM Tache
WHERE statut=0
ORDER BY priorite DESC;

CREATE OR REPLACE VIEW Vue_Taches_Terminees AS
SELECT idTache, intitule, idRealisateur
FROM Tache 
WHERE statut=1;

CREATE OR REPLACE VIEW Vue_Taches_Realisees_Utilisateur AS
SELECT t.idTache, t.intitule, t.dateDebut, t.dateEcheance, t.priorite, t.idCreateur, t.idRealisateur
FROM Tache t
WHERE t.idRealisateur IS NOT NULL;

CREATE OR REPLACE VIEW Vue_Taches_Par_Categorie AS
SELECT categorie, COUNT(*) AS nombre_taches
FROM Tache
GROUP BY categorie
ORDER BY categorie;

SELECT * FROM Vue_Taches_Par_Priorite;
SELECT * FROM Vue_Taches_Terminees;
SELECT * FROM Vue_Taches_Realisees_Utilisateur WHERE idRealisateur = 1; -- remplacer idCreateur par l'utilisateur souhaité
SELECT * FROM Vue_Taches_Par_Categorie;
