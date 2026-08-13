use Music_01;

drop table if exists Movie;

Create table Movie (
    Movie_ID int identity(1,1) primary key,
    Movie_title nvarchar(255) not Null,
    release_date date,
    run_time smallint,
    soundtrack_album_id int,
    score tinyint,

    constraint FK_albumID foreign key (soundtrack_album_id) references Album(Album_ID),
    constraint CK_score check (score between 1 and 10)
)


insert into Movie (Movie_title, release_date, run_time, soundtrack_album_id, score)
values
('The Lion King', '1994-05-15', 88, 246, 8),
('Gnomeo and Juliet', '2011-02-11', 84, 247, NULL),
('Labyninth', '2017-11-12', 108, 259, 9),
('Iron Man 2', '2010-05-07', 124, 310, 7),
('A Star a Born', '2018-10-05', 133, 414, NULL),
('Evita', '1956-11-19', 130, 424, NULL)


select 
    m.Movie_title,
    m.release_date,
    a.Title as Album_Title,
    ar.Artist,
    a.Release_date as Album_Release
from
    Movie m
JOIN 
    Album a ON m.soundtrack_album_id = a.Album_ID
join 
    artist ar on ar.Artist_ID = a.Artist_ID
