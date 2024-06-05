-- 1. Les listes de tâches ayant au moins 5 tâches et appartenant à des utilisateurs habitant en France. ----------

SELECT lt.idListe, lt.nomListe, u.nom, u.prenom, u.adresse
FROM Liste_tache lt
JOIN Utilisateur u ON lt.idCreateur = u.idUser
JOIN Tache t ON lt.idListe = t.idListeTache
WHERE u.adresse = 'France'
GROUP BY lt.idListe, lt.nomListe, u.idUser, u.nom, u.prenom, u.adresse
HAVING COUNT(t.idTache) >= 5
ORDER BY lt.idListe;



---- 2. Les programmes de tâche ayant le plus de points positifs (somme des points) associés aux tâches terminées. ---------

SELECT lt.idListe, lt.nomListe, COALESCE(COUNT(t.idTache), 0) AS somme_points
FROM Liste_Tache lt
LEFT JOIN Tache t ON lt.idListe = t.idListeTache AND t.statut = 1 -- Tâche terminée
GROUP BY lt.idListe, lt.nomListe
ORDER BY somme_points DESC;


----- 3. Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre de tâches total (périodique et non-périodique) et son nombre de tâches périodiques total.-----------

SELECT u.idUser, u.login, u.nom, u.prenom, u.adresse,
COUNT(a.idTache) AS nombre_total_taches_assignees,
SUM(CASE WHEN t.estPeriodique = 1 THEN 1 END) AS nombre_total_taches_periodiques_assignees
FROM Utilisateur u
LEFT JOIN Assignation a ON u.idUser = a.idUser
LEFT JOIN Tache t ON a.idTache = t.idTache
GROUP BY u.login, u.nom, u.prenom, u.adresse, u.idUser;



--- 4. Pour chaque tâche, le nombre de dépendance à effectuer avant que la tâche puisse être réalisée. ---------

SELECT t.idTache, t.intitule,
COUNT(d.idTacheEnfant) AS nombre_dependances
FROM Tache t
LEFT JOIN Dependances d ON t.idTache = d.idTacheEnfant
GROUP BY t.idTache, t.intitule
ORDER BY t.idTache;



--- 5. Les 10 utilisateurs ayant gagné le plus de points sur leur score au cours de la semaine courante.-----

SELECT u.idUser, u.login, u.nom, u.prenom, COALESCE(COUNT(t.idTache), 0) AS score_gagne_semaine
FROM Utilisateur u
JOIN Assignation a ON u.idUser = a.idUser
JOIN Tache t ON a.idTache = t.idTache
WHERE t.statut = 1 AND TRUNC(t.dateFin) >= TRUNC(SYSDATE, 'WW')  -- Filtrer sur la semaine actuelle
GROUP BY u.idUser, u.login, u.nom, u.prenom
ORDER BY score_gagne_semaine DESC
FETCH FIRST 10 ROWS ONLY;  -- Limiter aux 10 premiers résultats

