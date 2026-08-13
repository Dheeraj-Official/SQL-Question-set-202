USE DoctorWho;

DECLARE @characters TABLE(
    CharacterId INT,
    CharacterName VARCHAR(100),
    CharacterType VARCHAR(100)
);

INSERT INTO
    @characters(
        CharacterId,
        CharacterName,
        CharacterType
    )
SELECT
    DoctorId,
    DoctorName,
    'Doctor'
FROM
    tblDoctor;


INSERT INTO
    @characters(
        CharacterId,
        CharacterName,
        CharacterType
    )
SELECT
    CompanionId,
    CompanionName,
    'Companion'
FROM
    tblCompanion;


INSERT INTO
    @characters(
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


SELECT * FROM @characters ORDER BY CharacterName DESC;