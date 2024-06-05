CREATE OR REPLACE PROCEDURE generer_suggestions(
    p_id_utilisateur IN NUMBER,
    p_n_suggestions IN NUMBER,
    p_n_mots_communs IN NUMBER)

IS
    TYPE stopword_table_type IS TABLE OF VARCHAR2(100);
    stopwords stopword_table_type := stopword_table_type('le', 'la', 'de', 'faire', 'avoir');
       -- Convertir la table de type en une liste
    stopword_list stopword_table_type := stopword_table_type(
        'le', 'la', 'de', 'faire', 'avoir'
    );
    
        -- Déclaration d'un curseur pour récupérer les utilisateurs similaires
    CURSOR cursor_utilisateurs_similaires IS
        SELECT DISTINCT a.idUser
        FROM assignation a
        JOIN tache t ON a.idTache = t.idTache
        JOIN utilisateur u ON a.idUser = u.idUser
        WHERE a.idUser <> p_id_utilisateur
        AND t.idTache IN 
        (
            SELECT idTache
            FROM tache
            WHERE idCreateur = p_id_utilisateur
        )
        AND t.idCreateur <> p_id_utilisateur
        AND t.idTache IN 
        (
            SELECT idTache
            FROM tache
            WHERE idCreateur = p_id_utilisateur
        )
        AND t.idCreateur <> p_id_utilisateur
        AND (SELECT COUNT (DISTINCT t.intitule)
             FROM tache t
             WHERE LOWER(t.description) NOT MEMBER OF stopword_list) >= p_n_mots_communs
        GROUP BY a.idUser
        HAVING COUNT(DISTINCT t.idTache) >= p_n_suggestions;
        idUtilisateur assignation.idUser%TYPE;

        
        -------Curseur de suggestions tache similaire -------
        CURSOR cursor_suggestions  IS
        SELECT t.idTache, t.description
        FROM tache t
        JOIN utilisateur u ON t.idCreateur = u.idUser
        WHERE u.idUser 
        IN (
                SELECT idUtilisateur
                FROM TABLE(cursor_utilisateurs_similaires) 
            )
        ORDER BY COUNT(*) DESC
        --WHERE ROWNUM <= n_suggestions;
        FETCH FIRST n_suggestions ROWS ONLY; -- Utilisation de FETCH FIRST pour limiter le nombre de résultats
        id_Tache tache.idTache%TYPE;

BEGIN
    OPEN cursor_utilisateurs_similaires;
    LOOP
        FETCH cursor_utilisateurs_similaires INTO idUtilisateur;
        EXIT WHEN cursor_utilisateurs_similaires%NOTFOUND;

        OPEN cursor_suggestions;
        LOOP
            FETCH cursor_suggestions INTO id_Tache;
            EXIT WHEN cursor_suggestions%NOTFOUND;

            -- Ajouter la tâche à la liste des suggestions
            INSERT INTO assignation (idUser, idTache)
            VALUES (idUtilisateur, id_tache);
        END LOOP;
        CLOSE cursor_suggestions;
    END LOOP;
    CLOSE cursor_utilisateurs_similaires;
END;
/

BEGIN 
    generer_suggestions(2, 2, 1);
END;