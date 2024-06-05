# Projet-BDD-ToDoList

DIALLO Aissata
IGERSHEIM Emilie



## I) Rappels des choix fait pour la partie 1:
    • Les tâches sont présentes en doublon dans les tables : soit Tache et Tache_Passee, soit Tache et Tache_A_Realiser. Pour garantir la présence d'une tâche dans les deux tables, des déclencheurs ont été créés, évitant ainsi d'effectuer des insertions supplémentaires pour les mêmes données (et éviter toute incohérence). Ces 3 déclencheurs sont dans declencheur.sql.
    • Les tâches sont considérées comme compétitives c’est-à-dire que plusieurs utilisateurs peuvent être assignés à une même tâche mais seul le premier utilisateur l’ayant accomplie est désigné comme réalisateur de cette tâche, seul le score de cet utilisateur sera augmenté.
    • Il est normal d’obtenir des erreurs en exécutant le script car à la fin du fichier donnees.sql se trouvent des requêtes qui ne peuvent pas s’insérer afin de nous assurer que les contraintes sont correctes.
      
## II) Nouveaux ajouts au projet de la partie 1:
    • Le champ idTache de la table Tache est désormais auto-incrémenté, et un nouveau champ, dateAccomplie, a été ajouté pour enregistrer la date à laquelle une tâche a été accomplie
    • Introduction de la table Assignation comprenant les clés idUser et idTache. Cette table vise à mettre en œuvre la relation many-to-many entre les deux tables. Un utilisateur peut être assigné à 0 ou N tâches, et une tâche peut être assignée à 0 ou N utilisateurs.
    • Création d’une table Tache_Archivee qui contient les mêmes champs que la table Tache. Lorsqu’une tache est passée ou réalisée, elle migre vers la nouvelle table et est supprimée des tables d’origine, ainsi que toutes ses dépendances.

## III) Présentation détaillée de la mise en œuvre de la deuxième partie du projet:
### 1) Requêtes SQL
Les requêtes SQL de la partie 2 ont été mises en œuvre conformément à notre compréhension des problématiques. Des curseurs ont été créés afin d'optimiser l'exécution de ces requêtes, et ces derniers sont répertoriés dans le fichier 'curseur.sql'.

#### a. Les listes de tâches ayant au moins 5 tâches et appartenant à des utilisateurs habitant en France.
La requête extrait des listes de tâches, avec des détails sur le créateur de la liste et des informations sur les tâches associées. Elle filtre les résultats pour inclure uniquement les listes de tâches créées par des utilisateurs en France, regroupe les résultats par liste de tâches, et ne conserve que les listes ayant au moins 5 tâches, triées par l'identifiant de la liste de tâches.

#### b. Les programmes de tâche ayant le plus de points positifs (somme des points) associés aux tâches terminées.
La requête génère une liste des listes de tâches avec le nombre total de points calculé en comptant le nombre de tâches terminées pour chaque liste. Et elle classe ces listes par ordre décroissant de la somme des points. Par programme de tache on a compris «liste de tache» , et donc on a compter le nombre de taches terminées dans chaque liste de tache puisqu’on est parti du principe qu’une tache terminé génère 1 point et on obtient par ordre décroissant des résultats la liste de tache qui a cumulé le plus de points.

#### c. Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre de tâches total (périodique et non-périodique) et son nombre de tâches périodiques total.
Cette requête génère une liste d'utilisateurs avec des informations détaillées, notamment le nombre total de tâches qui leur ont été assignées et le nombre total de tâches périodiques assignées. La condition sur la somme des tâches périodiques assure que seules les tâches périodiques sont prises en compte dans le décompte.
#### d. Pour chaque tâche, le nombre de dépendance à effectuer avant que la tâche puisse être réalisée.
La requête génère une liste des tâches avec leur identifiant, leur intitulé, et le nombre de dépendances associées, triées par l'identifiant de la tâche. On effectue le décompte du nombre de références à la tâche enfant. Ceci permet de connaître le nombre de taches parents qu’une tache enfant possède, ce qui équivaut à son nombre de dépendances avant qu’elle ne soit réalisée.
#### e. Les 10 utilisateurs ayant gagné le plus de points sur leur score au cours de la semaine courante.
La requête génère une liste des utilisateurs avec le nombre de tâches accomplies par chacun au cours de la semaine actuelle, triée par ordre décroissant du nombre de tâches réalisées. Les résultats sont ensuite limités aux 10 premiers utilisateurs. Puisqu’une tache génère 1 point si elle est réalisée, on compte le nombre de taches réalisées par un utilisateur dans la semaine courante, ce qui revient au nombre de points qu’il a gagné sur son score pendant cette semaine.
    • Index Optimisateur de Requetes
Ces index visent à accélérer les opérations de recherche sur les tables associées en optimisant l'accès aux données basé sur des colonnes spécifiques. Les index creés sont sur les colonnes «idCreateur» de la table ‘Liste_Tache’, «adresse» de la table Utilisateur et «idListeTache», «statut», «estPeriodique»,  «dateFin» de la table Tache.
### 2) Procédures et fonctions PL/SQL

Système de points
Une tâche rapporte un point si elle est effectuée avant sa date d’échéance et fait perdre un point si elle n’est pas effectué avant sa date d’échéance. Si elle est réalisée après sa date d’échéance, elle ne rapporte aucun point.

La fonction qui calcule le nombre de point gagnés et perdus au cours de la semaine doit être exécutée en fin de semaine. Cette fonction prend en paramètres l'identifiant de l'utilisateur, ainsi que deux paramètres OUT, pointsGagnes et pointsPerdus, qui sont utilisés pour stocker respectivement le nombre de points gagnés et perdus. Elle commence par déterminer le nombre de tâches terminées au cours de la semaine. Étant donné qu'un utilisateur ne peut accomplir que les tâches auxquelles il est assigné, on sélectionne les tâches terminées en filtrant celles qui sont assignées à l’utilisateur et qu’il a réalisées au cours de la semaine.
Pour calculer le nombre de tâches passées, on s’intéresse aux taches auxquelles est assigné l'utilisateur et ne retenons que celles qui n’ont pas été réalisées par l’utilisateur au cours de la semaine.
Enfin, comme une fonction doit retourner une valeur, la fonction renvoie la différence entre pointsGagnes et pointsPerdus, représentant le score total de l'utilisateur pour la semaine.

Pour la procédure permettant d’archiver les tâches passées, nous avons utilisé la nouvelle table «Tache_Archivee». La procédure parcourt les tâches présentent dans la table Tache_Passee. Pour chaque tâche passée, toutes les dépendances qui lui sont associées sont supprimées, ainsi que ses assignations. Ensuite, pour pouvoir archiver la tâche passée, nous cherchons la tâche correspondante dans la table Tache. Une fois trouvée, nous insérons toutes les données de cette tâche dans la table Tache_Archivee. La tâche désormais archivée est supprimée de Tache_Passee et de Tache.


### 3) Déclencheurs

Le score de chaque utilisateur est stocké dans la table Utilisateur. 
Dès qu’une insertion ou modification est faite sur la table Tache, le déclencheur mise_a_jour_score est activé. Si la tâche est marquée comme accomplie avant sa date d’échéance, le score de l’utilisateur l’ayant effectuée est incrémenté de 1. Dans le cas contraire, si la tâche n’est pas accomplie et que sa date d’échéance est dépassée, son score est décrémenté de 1.

Avant l’insertion d’un tâche périodique non accomplie, le déclencheur taches_associees_aux_taches
_periodiques crée les tâches associées en fonction de la période spécifiée (jour, semaine ou mois). Ces tâches non périodiques associées héritent des détails de la tâche principale, mais avec des dates ajustées selon la période.
Un déclencheur supplémentaire check_statut_tache_periodique est mis en place pour garantir qu'une tâche périodique ne peut être marquée comme accomplie que si toutes ses "sous-tâches" associées sont également terminées.

