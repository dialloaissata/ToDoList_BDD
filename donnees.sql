--------------------------------------------------------------------------------------------------------------------------------------------
-- Insertion de données dans la table Utilisateur:
--------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (1, 'Doe', 'John', 'France', TO_DATE('1964-09-26', 'YYYY-MM-DD'), TO_DATE('2019-07-24', 'YYYY-MM-DD'), 'jdoe09', 'F270E979');
INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (2, 'Coleman', 'Isaiah', 'Belgique', TO_DATE('1973-09-07', 'YYYY-MM-DD'), TO_DATE('2018-01-15', 'YYYY-MM-DD'), 'icoleman03', '123456_');

INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (3, 'Marshall', 'Basil', 'France', TO_DATE('1986-10-25', 'YYYY-MM-DD'), TO_DATE('2022-04-03', 'YYYY-MM-DD'), 'bmarshal34', 'C4DCC932er');
INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (4, 'Santos', 'Ethan', 'Allemagne', TO_DATE('2012-06-18', 'YYYY-MM-DD'), TO_DATE('2018-12-06', 'YYYY-MM-DD'), 'esantos66', '58C2fjddu_dhd');
INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (5, 'Robinson', 'Haviva', 'Hollande', TO_DATE('1951-06-16', 'YYYY-MM-DD'), TO_DATE('2022-11-06', 'YYYY-MM-DD'), 'hrobinso88', '7AAD2B5D');
INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (6, 'Santiago', 'Kalia', 'Belgique', TO_DATE('1965-07-03', 'YYYY-MM-DD'), TO_DATE('2020-03-04', 'YYYY-MM-DD'), 'ksantiag07', '59F13A7');
INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (7, 'Silva', 'Fitzgerald', 'France', TO_DATE('2009-11-23', 'YYYY-MM-DD'), TO_DATE('2021-01-24', 'YYYY-MM-DD'), 'fsilva98', 'BA478dj_1');
INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
VALUES (8, 'Tipain', 'Marcel', 'Grece', TO_DATE('2024-02-21', 'YYYY-MM-DD'), TO_DATE('2021-10-29', 'YYYY-MM-DD'), 'mtipain66', 'abcdedf');

--------------------------------------------------------------------------------------------------------------------------------------------
--Insertion dans la table Projet:
--------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Projet (idProjet, nomProjet, statut, idCreateur)
VALUES (1, 'Projet de Réaménagement de la Maison', 'En cours', 1);
INSERT INTO Projet (idProjet, nomProjet, statut, idCreateur)
VALUES (2, 'Projet de Recherche en Chimie', 'En cours', 2);
INSERT INTO Projet (idProjet, nomProjet, statut, idCreateur)
VALUES (3, 'Projet de Mise en Forme Physique', 'En cours', 4);

--------------------------------------------------------------------------------------------------------------------------------------------
--Insertion dans la table Liste_Taches:
--------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Liste_tache (idListe, nomListe, idProjet, idCreateur)
VALUES (1, 'Tâches de Rénovation de la Cuisine', 1, 1);
INSERT INTO Liste_tache (idListe, nomListe, idProjet, idCreateur)
VALUES (2, 'Tâches pour la Recherche en Chimie', 2, 2);
INSERT INTO Liste_tache (idListe, nomListe, idProjet, idCreateur)
VALUES (3, 'Tâches de vacances', 3, 3);
INSERT INTO Liste_tache (idListe, nomListe, idProjet, idCreateur)
VALUES (4, 'Entraînement Quotidien', 3, 4);

--------------------------------------------------------------------------------------------------------------------------------------------
-- Insertion de données dans la table Tache;
--------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache) --idTache 1 passée
VALUES ('Aspirateur', 'Passer l''aspirateur dans le salon', 'Ménage', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-01', 'YYYY-MM-DD'), 2, 0, NULL, 0, NULL, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 1, 1, 1);

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie) --idTache 2 
VALUES ('Linge', 'Etendre le linge', 'Ménage', TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 1, 1, NULL, 0, NULL, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 2, 1, 1, 2, TO_DATE('2023-11-02', 'YYYY-MM-DD'));

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur,dateAccomplie) --idTache 3 
VALUES ('cuisine', 'Preparer le diner', 'Manger', TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-03', 'YYYY-MM-DD'), 1, 1, NULL, 0, NULL, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 2, 1, 1, 2, TO_DATE('2023-11-03', 'YYYY-MM-DD'));

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache) --idtache 4
VALUES ('Terminer l''exercice de mathématiques', 'Résoudre les problèmes de l''exercice 3', 'Université', TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-03', 'YYYY-MM-DD'), 3, 0, 'http://lien3.com', 0, NULL, TO_DATE('2023-11-03', 'YYYY-MM-DD'), 2, 2, 1);

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie) --idTache 5
VALUES ('Réviser pour l''examen de chimie', 'Passer en revue les notes et les chapitres', 'Université', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'), 2, 1, 'http://lien4.com', 0, NULL, TO_DATE('2023-11-04', 'YYYY-MM-DD'), 1, 2, 2, 6, TO_DATE('2023-11-02', 'YYYY-MM-DD'));

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 6
VALUES ('Tâche 6', 'Description de la tâche 6', 'Catégorie C', TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-07', 'YYYY-MM-DD'), 3, 0, 'http://lien3.com', 0, NULL, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 1, 2, 2);

INSERT INTO Tache (intitule, description, categorie, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 7, +1 point à idUser6
VALUES ('Regarder le dernier épisode de la série', 'Série à ne pas manquer', 'Loisirs', 1, 1, 'http://lien7.com', 0, NULL, TO_DATE('2024-11-07', 'YYYY-MM-DD'), 2, 3, 3, 6, SYSDATE);

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache8
VALUES ('Faire 30 minutes de yoga', 'Séance de yoga quotidienne', 'Sport', TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-12-08', 'YYYY-MM-DD'), 2, 1, NULL, 0, NULL, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 2, 3, 3, 4, TO_DATE('2023-12-01', 'YYYY-MM-DD'));

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 9
VALUES ('Emails', 'Vérification quotidienne des emails professionnels', 'Travail', TO_DATE('2023-11-09', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), 2, 0, NULL,  0, NULL, TO_DATE('2023-11-09', 'YYYY-MM-DD'), 1, 3, 3);

INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 10
VALUES ('Vétérinaire', 'rdv vétérinaire pour le chat', 'Animaux', SYSDATE - 3, SYSDATE +2, 1, 1, NULL, 0, NULL, SYSDATE, 2, 1, 1, 3, SYSDATE);

INSERT INTO Tache (intitule, description, categorie,dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 11
VALUES ('Voyage', 'Visiter la cathedrale', 'Site touristique', TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-02', 'YYYY-MM-DD'), 1, 1, NULL, 0, NULL, TO_DATE('2024-01-02', 'YYYY-MM-DD'), 6, 1, 4, 3, TO_DATE('2024-01-02', 'YYYY-MM-DD'));

INSERT INTO Tache (intitule, description, categorie,dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 12
VALUES ('Plage', 'Aller à la plage ', 'Detente', TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-06', 'YYYY-MM-DD'), 1, 0, NULL, 0, NULL, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 2, 3, 4);


--Données qui doivent être d'abord dans Tache_Passee puis Tache_Archivee
INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 13
VALUES ('Serpillière', 'Passer la serpillière dans la chambre', 'Ménage', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 2, 1, NULL, 0, NULL, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1, 1, 1, 1, TO_DATE('2023-12-31', 'YYYY-MM-DD'));
INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 14
VALUES ('TP de réseau', 'Terminer le TP de réseau', 'Université', TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-03', 'YYYY-MM-DD'), 3, 1, 'http://lien3.com', 0, NULL,  TO_DATE('2023-11-08', 'YYYY-MM-DD'), 2, 2, 1, 2, TO_DATE('2023-11-03', 'YYYY-MM-DD'));

--Données qui doivent être dans Tache et Tache_A_Realiser
INSERT INTO Tache (intitule, description, categorie, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 15
VALUES ('Linge', 'Laver le linge', 'Ménage', 1, 0, NULL, 0, NULL, TO_DATE('2024-11-02', 'YYYY-MM-DD'), 2, 1, 1);

--2 taches qui apportent chacune 1 point à l'utilisateur 1
INSERT INTO Tache (intitule, description, categorie, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 16
VALUES ('Projet de BDD', 'Terminer le projet de BDD', 'Université', 3, 1, 'http://lien3.com', 0, NULL, TO_DATE('2025-11-03', 'YYYY-MM-DD'), 2, 2, 1, 1, SYSDATE);
INSERT INTO Tache (intitule, description, categorie, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)--idTache 17
VALUES ('Réviser pour l''examen d''anglais', 'Apprendre le nouveau vocabulaire', 'Université', 2, 1, 'http://lien4.com', 0, NULL, SYSDATE, 1, 2, 2, 1, SYSDATE);

--Tache qui enlève 1 point à l'utilisateur 1
INSERT INTO Tache (intitule, description, categorie, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 18 non réalisée à temps, enlève des points à tous ceux qui y sont assignés
VALUES ('Film', 'Regarder un film', 'Loisirs', 1, 0, 'http://lien7.com', 0, NULL, TRUNC(SYSDATE, 'IW'), 1, 3, 3); 

--Pour tester le trigger pour créer les tâches associées aux tâches periodiques:
--répondre à ses mails pendant les 5 prochains jours (jours courant inclu)
INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 19
VALUES('Mail', 'Répondre à ses mails', 'Travail', SYSDATE, SYSDATE+4, 2, 0, NULL, 1, 'jour', SYSDATE+4, 3, 1, 1);
--faire les courses une fois par semaine pendant 3 semaines
INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 20
VALUES('Course', 'Faire les courses', 'Maison', SYSDATE, SYSDATE+20, 3, 0, NULL, 1, 'semaine',SYSDATE+21, 4, 2, 3);
--aller au théâtre une fois par mois pendant 4 mois
INSERT INTO Tache ( intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)--idTache 21
VALUES('aller au théâtre', 'aller regarder une pièce de théâtre', 'culture', SYSDATE, SYSDATE+116, 1, 0, 'https://www.tns.fr/', 1, 'mois', SYSDATE+116, 5, 2, 1);

--------------------------------------------------------------------------------------------------------------------------------------------
-- Insertion de données dans la table Assignation;
--------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Assignation (idUser, idTache) 
VALUES (1, 1);
INSERT INTO Assignation (idUser, idTache) 
VALUES (1, 2);
INSERT INTO Assignation (idUser, idTache) 
VALUES (2, 2);
INSERT INTO Assignation (idUser, idTache) 
VALUES (2, 3); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (3, 10); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (4, 10); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (5, 10); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (1, 5);
INSERT INTO Assignation (idUser, idTache) 
VALUES (6, 5); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (6, 7); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (4, 8); 
INSERT INTO Assignation (idUser, idTache) 
VALUES (3, 11);
INSERT INTO Assignation (idUser, idTache)
VALUES (1, 16);
INSERT INTO Assignation (idUser, idTache)
VALUES (1, 17);
INSERT INTO Assignation (idUser, idTache)
VALUES (1, 18);
INSERT INTO Assignation (idUser, idTache)
VALUES(1,19);
INSERT INTO Assignation (idUser, idTache)
VALUES(2,20);

--------------------------------------------------------------------------------------------------------------------------------------------
-- Insertion de données dans la table Dependance :
--------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Dependances (idTacheParent, idTacheEnfant)
VALUES (1, 2); -- La tâche 2 dépend de la tâche 1
INSERT INTO Dependances (idTacheParent, idTacheEnfant)
VALUES (6, 5); -- La tâche 5 dépend de la tâche 6
INSERT INTO Dependances (idTacheParent, idTacheEnfant)
VALUES (3, 2); -- La tâche 2 dépend de la tâche 3
INSERT INTO Dependances (idTacheParent, idTacheEnfant)
VALUES (3, 4); -- La tâche 4 dépend de la tâche 3
INSERT INTO Dependances (idTacheParent, idTacheEnfant)
VALUES (7, 6); -- La tâche 6 dépend de la tâche 7

--------------------------------------------------------------------------------------------------------------------------------------------
-------------------DONNEES QUI NE PEUVENT PAS S'INSERER DANS LES TABLES (CAR NE RESPECTENT PAS LES CONTRAINTES)-----------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

--INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
--VALUES (3, 'Meyer', 'Jin', '12 avenue des souris', TO_DATE('1990-01-18', 'YYYY-MM-DD'), TO_DATE(TO_DATE('2016-03-16', 'YYYY-MM-DD'), 'YYYY-MM-DD'), 'jin-meyer', 'ahahaha*/'); -- mdp
--INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
--VALUES (5, 'Wallace', 'Beverly', '11 rue de l''écureuil', TO_DATE(TO_DATE('2009-06-30', 'YYYY-MM-DD'), 'YYYY-MM-DD'), TO_DATE(TO_DATE('2021-02-16', 'YYYY-MM-DD'), 'YYYY-MM-DD'), 'bwallace', 'E5992707'); --login
--INSERT INTO Utilisateur (idUser, nom, prenom, adresse, dateNaissance, dateInscription, login, mdp)
--VALUES (10, 'Webb', 'Grace', '67 rue de l''axolotl', TO_DATE('1968-02-21', 'YYYY-MM-DD'), TO_DATE(TO_DATE('2021-10-29', 'YYYY-MM-DD'), 'YYYY-MM-DD'), 'gwebb', 'abcd_efgi9'); --login

--INSERT INTO Projet (idProjet, nomProjet, statut, idCreateur)
--VALUES (-1, 'Projet cinématographique', 'En cours', 4); -- ID négatif

--INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)
--VALUES ('Tâche 3','Description de la tâche 3','Catégorie A',TO_DATE('2023-11-11', 'YYYY-MM-DD'),TO_DATE('2023-11-07', 'YYYY-MM-DD'), 3, 0,'http://lien3.com', 1,'semaine',TO_DATE('2023-11-07', 'YYYY-MM-DD'), 1, 2, 1); --dates de fin>date de début
--INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)
--VALUES ('Tâche 7','Description de la tâche 7','Catégorie B',TO_DATE('2023-11-01', 'YYYY-MM-DD'),TO_DATE('2023-11-05', 'YYYY-MM-DD'), 4, 0,'http://lien4.com', 1,'jour',TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1, 1, 1); --priorité non valide
--INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)
--VALUES ('Tâche 8','Description de la tâche 8','Catégorie B',TO_DATE('2023-11-01', 'YYYY-MM-DD'),TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1, 2,'http://lien5.com', 0, NULL, NULL, 2, 1, 2); --statut non valide
--INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)
--VALUES ('Tâche 9','Description de la tâche 9','Catégorie C',TO_DATE('2023-11-01', 'YYYY-MM-DD'),TO_DATE('2023-11-05', 'YYYY-MM-DD'), 2, 0,'http://lien6.com', 1,'année',TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1, 1, 3); --période non valide
--INSERT INTO Tache (intitule, description, categorie, dateDebut, dateFin, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache)
--VALUES ('Tâche 10','Description de la tâche 10','Catégorie C',TO_DATE('2023-11-01', 'YYYY-MM-DD'),TO_DATE('2023-11-05', 'YYYY-MM-DD'), 2, 0,'http://lien6.com', 1,'années',TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1, 1, 1); --référence à un projet inexistant


-- idUser 1 n'est pas assigné à cette tâche
INSERT INTO Tache (intitule, description, categorie, priorite, statut, lienExterne, estPeriodique, periode, dateEcheance, idCreateur, idProjet, idListeTache, idRealisateur, dateAccomplie)
VALUES ('Faire 30 minutes de yoga', 'Séance de yoga quotidienne', 'Sport', 2, 1, NULL, 0, NULL, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 2, 3, 3, 1, TO_DATE('2023-11-02', 'YYYY-MM-DD'));