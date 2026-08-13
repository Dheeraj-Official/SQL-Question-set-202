USE DoctorWho;

BEGIN TRANSACTION

INSERT INTO dbo.tblDoctor(
    DoctorName,
    DoctorNumber
) VALUES (
    'Shaun the Sheep',
    13
)

IF 2 + 2 = 4
    ROLLBACK TRANSACTION
ELSE
    COMMIT TRANSACTION

SELECT * FROM tblDoctor;

DELETE FROM tblDoctor
WHERE DoctorNumber > 12;
