USE DoctorWho;

drop table if exists #Characters;
-- IF OBJECT_ID('tempdb.dbo.#Characters', 'U') IS NOT NULL DROP TABLE #Characters;

SELECT
    DoctorId AS CharacterId,
    DoctorName AS CharacterName,
    CAST('Doctor' AS VARCHAR(10)) AS CharacterType INTO #Characters
FROM
    tblDoctor;

SET
    IDENTITY_INSERT #Characters ON;

-- append companions
INSERT INTO
    #Characters (CharacterId,CharacterName,CharacterType)
SELECT
    CompanionId,
    CompanionName,
    'Companion'
FROM
    tblCompanion;

-- append enemies
INSERT INTO
    #Characters
    (
        CharacterId,
        CharacterName,
        CharacterType
    )
SELECT
    EnemyId,
    EnemyName,
    'Enemy'
FROM
    tblEnemy;

-- show results
SELECT
    *
FROM
    #Characters
ORDER BY
    CharacterName DESC;