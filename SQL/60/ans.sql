use DoctorWho;

SELECT
    c.CompanionName
FROM
    tblCompanion AS c
    LEFT OUTER JOIN tblEpisodeCompanion AS ec ON c.CompanionId = ec.CompanionId
WHERE
    ec.CompanionId IS NULL;