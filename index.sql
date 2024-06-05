CREATE INDEX idx_liste_tache_createur ON Liste_Tache(idCreateur);
CREATE INDEX idx_utilisateur_adresse ON Utilisateur(adresse);
CREATE INDEX idx_tache_idliste ON Tache(idListeTache);
CREATE INDEX idx_tache_statut ON Tache(statut);
CREATE INDEX idx_tache_estperiodique ON Tache(estPeriodique);
CREATE INDEX idx_tache_datefin ON Tache(dateFin);
