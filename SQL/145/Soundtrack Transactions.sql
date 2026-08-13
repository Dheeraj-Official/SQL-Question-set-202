use Music_01
go

--------------------------------------------------
--Delete any existing copy of the Soundtrack table
--------------------------------------------------
drop table if exists dbo.Soundtrack
go

-------------------------------
--Create a new Soundtrack table
-------------------------------
create table dbo.Soundtrack(
	Soundtrack_ID int primary key identity(1, 1) not null
	,Title nvarchar(255) not null
	,Release_Date date null
	,[Length] nvarchar(6) null
	,Volume tinyint null
	,constraint CHK_Volume check (Volume between 1 and 10)
)
go


-----------------------------------
--Insert rows into Soundtrack table
-----------------------------------
insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
values ('The Lion King: Original Motion Picture Soundtrack', '1994-05-31', '46:40', 7)

insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
values ('Labyrinth', '1986-06-23', '43:33', 7)

insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
values('Iron Man 2', '2010-04-19', '70:15', 10)

insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
values ('This is Spinal Tap', '1984-03-02', '35:36', 11)

insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
values('A Star is Born', '2018-10-05', '70:01', 6)

insert into dbo.Soundtrack(Title, Release_Date, [Length], Volume)
values('Evita', '1996-11-12', '108:53', 5)


-----------------------------------
--Select data from Soundtrack table
-----------------------------------
select
	st.Soundtrack_ID
	,st.Title
	,st.Release_Date
	,st.[Length]
	,st.Volume
from
	dbo.Soundtrack as st