-- Create the database
CREATE DATABASE trainingCourses;
GO

USE trainingCourses;
GO

-- People/attendees table
CREATE TABLE tblPerson
(
    PersonID    int IDENTITY(1,1) PRIMARY KEY,
    FirstName   varchar(50) NOT NULL,
    LastName    varchar(50) NOT NULL,
    Email       varchar(100) NULL
);
GO

-- Courses table
CREATE TABLE tblCourse
(
    CourseID    int IDENTITY(1,1) PRIMARY KEY,
    CourseName  varchar(100) NOT NULL,
    StartDate   date NOT NULL,
    Location    varchar(100) NULL
);
GO

-- Junction table linking people to courses they attend
CREATE TABLE tblAttendee
(
    AttendeeID  int IDENTITY(1,1) PRIMARY KEY,
    PersonID    int NOT NULL FOREIGN KEY REFERENCES tblPerson(PersonID),
    CourseID    int NOT NULL FOREIGN KEY REFERENCES tblCourse(CourseID)
);
GO

-- Sample data: people
INSERT INTO tblPerson (FirstName, LastName, Email) VALUES
('Alice',   'Anderson', 'alice.anderson@example.com'),
('Brian',   'Baxter',   'brian.baxter@example.com'),
('Carla',   'Chen',     'carla.chen@example.com'),
('David',   'Douglas',  'david.douglas@example.com'),
('Elena',   'Evans',    'elena.evans@example.com'),
('Frank',   'Foster',   'frank.foster@example.com'),
('Grace',   'Green',    'grace.green@example.com'),
('Henry',   'Harris',   'henry.harris@example.com');
GO

-- Sample data: courses
INSERT INTO tblCourse (CourseName, StartDate, Location) VALUES
('Introduction to SQL',      '2026-01-12', 'Manchester'),
('Advanced Power BI',        '2026-02-03', 'London'),
('Python for Data Analysis', '2026-03-15', 'Glossop'),
('Excel VBA Essentials',     '2026-04-20', 'London'),
('SQL Server Performance',   '2026-05-05', 'Manchester');
GO

-- Sample data: attendees (linking people to courses)
INSERT INTO tblAttendee (PersonID, CourseID) VALUES
(1,1), (2,1), (3,2), (4,2), (5,3), (6,3), (7,4), (8,5), (1,3), (3,5);
GO