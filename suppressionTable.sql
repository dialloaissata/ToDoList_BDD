BEGIN
         -- Suppression des tables
    EXECUTE IMMEDIATE 'DROP TABLE Tache_Archivee';
    EXECUTE IMMEDIATE 'DROP TABLE Dependances';
    EXECUTE IMMEDIATE 'DROP TABLE Tache_A_Realiser';
    EXECUTE IMMEDIATE 'DROP TABLE Tache_Passee';
    EXECUTE IMMEDIATE 'DROP TABLE Assignation';
    EXECUTE IMMEDIATE 'DROP TABLE Tache';
    EXECUTE IMMEDIATE 'DROP TABLE Liste_tache';
    EXECUTE IMMEDIATE 'DROP TABLE Projet';
    EXECUTE IMMEDIATE 'DROP TABLE Utilisateur';
    
             -- Suppression des vues
    EXECUTE IMMEDIATE 'DROP VIEW Vue_Taches_Terminees';
    EXECUTE IMMEDIATE 'DROP VIEW Vue_Taches_A_Realiser';
    EXECUTE IMMEDIATE 'DROP VIEW Vue_Taches_Par_Utilisateur';
    
         -- Suppression des index
    EXECUTE IMMEDIATE 'DROP INDEX idx_liste_tache_createur';
    EXECUTE IMMEDIATE 'DROP INDEX idx_utilisateur_adresse';
    EXECUTE IMMEDIATE 'DROP INDEX idx_tache_idliste';
    EXECUTE IMMEDIATE 'DROP INDEX idx_tache_statut';
    EXECUTE IMMEDIATE 'DROP INDEX idx_tache_estperiodice';
    EXECUTE IMMEDIATE 'DROP INDEX idx_tache_datefin';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
