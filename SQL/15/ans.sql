use Music_01

-- Q1
select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	Venue like 'a%z'

-- Q2
select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	[Address] like '%manchester%'
	and [Address] not like '%united states%'


-- Q3
select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	Venue like '%theatre%'
	or Venue like '%theater%'


-- Q4
select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	Venue like '%theat[er][er]%'


select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	(Venue like '%theatre%'
	or Venue like '%theater%')
	and Venue not like '%amphitheatre%'
	and Venue not like '%amphitheater%'


select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	Venue like '%theat[er][er]%'    
	and Venue not like '%amphitheat[er][er]%'


select
	Venue
	,[Address]
	,Other_names
from
	dbo.Venue
where
	Venue like '%pepsi%'
	or Other_names like '%pepsi%'
	or Venue like '%coca-cola%'
	or Other_names like '%coca-cola%'
	or Venue like '%red bull%'
	or Other_names like '%red bull%'
