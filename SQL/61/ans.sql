use WorldEvents;

SELECT
    Family.FamilyName,
    ISNULL(TopFamily.FamilyName + ' > ', '') + ISNULL(ParentFamily.FamilyName + ' > ', '') + Family.FamilyName AS [Family path]
FROM
    tblFamily AS Family
    LEFT OUTER JOIN tblFamily AS ParentFamily ON Family.ParentFamilyId = ParentFamily.FamilyID
    LEFT OUTER JOIN tblFamily AS TopFamily ON ParentFamily.ParentFamilyId = TopFamily.FamilyID
ORDER BY
    Family.FamilyName;