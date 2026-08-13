use DoctorWho;

drop table if exists tblProductionCompany;

create table tblProductionCompany(
    ProductionCompanyID int identity(1,1) primary key,  -- IDENTITY(seed, increment)
    ProductionCompanyName varchar(50),
    Abbreviation varchar(10)
);

INSERT INTO tblProductionCompany(
	ProductionCompanyName,
	Abbreviation
) VALUES (
	'British Broadcasting Corporation',
	'BBC'
),
(
	'Canadian Broadcasting Corporation',
	'CBC'
)

SELECT * FROM tblProductionCompany