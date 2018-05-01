DROP DATABASE club;
CREATE DATABASE club;
USE club;
CREATE TABLE Events(
	EventID int not null auto_increment,
	EventName varchar(40) not null,
	SDate Date not null,
	EDate Date not null,
	constraint pk_eid primary key (EventID)
);
INSERT INTO Events 
VALUES ( 
	null, 
	'Event 1',
	'2018-04-18',
	'2018-04-18'
);
INSERT INTO Events 
VALUES ( 
	null, 
	'Event 2',
	'2018-02-14',
	'2018-05-14'
);
INSERT INTO Events 
VALUES ( 
	null, 
	'Event 3',
	'2018-03-20',
	'2018-03-20'
);
CREATE TABLE Members(
	Username varchar(250) not null,
	Name varchar(30) not null,
	Password varchar(30) not null,
	Email varchar(80) not null,
	Priviledge varchar(10),
	constraint pk_uname primary key (Username),
	constraint emailUniq unique (Email)
);
INSERT INTO Members 
VALUES ( 
	'virresh', 
	'Viresh Gupta', 
	'pass',
	'viresh16118@iiitd.ac.in',
	'admin'
);
INSERT INTO Members 
VALUES ( 
	'ksandy', 
	'Name Two', 
	'pass',
	'unknown@iiitd.ac.in',
	'member'
);
INSERT INTO Members 
VALUES ( 
	'handle3', 
	'Name Three', 
	'pass',
	'unknown2@iiitd.ac.in',
	'member'
);
INSERT INTO Members 
VALUES ( 
	'bylder4', 
	'Name 4', 
	'pass',
	'bylder4@iiitd.ac.in',
	'member'
);
CREATE TABLE Achievement(
	Aid int not null auto_increment,
	Descr TEXT not null,
	constraint pk_aid primary key (Aid)
);
INSERT INTO Achievement 
VALUES ( 
	null, 
	'9th Rank at Topcoder Hackathon'
);
INSERT INTO Achievement 
VALUES ( 
	null, 
	'2nd Prize in byldathon'
);
INSERT INTO Achievement 
VALUES ( 
	null, 
	'finalist in Oone hack'
);
CREATE TABLE Resources(
	ResID int not null auto_increment,
	RName varchar(50) not null,
	Link text not null,
	PostedBy varchar(250) not null,
	constraint pk_rid primary key (ResID),
	constraint fk_postedby foreign key (PostedBy) references Members(Username)
);
INSERT INTO Resources 
VALUES ( 
	null, 
	'Hackathon starter kit',
	'https://www.topcoder.com/hackathon-starter-kit/',
	'virresh'
);
INSERT INTO Resources 
VALUES ( 
	null, 
	'Hackathon resources',
	'https://cookiecutter.readthedocs.io/en/latest/',
	'handle3'
);
INSERT INTO Resources 
VALUES ( 
	null, 
	'Alexa resources',
	'https://www.hackerearth.com/sprints/alexa-hackathon/custom-tab/resources/#Resources',
	'bylder4'
);
CREATE TABLE Attended(
	uname varchar(250) not null,
	eid int,
	constraint fk_validmem foreign key (uname) references Members(Username),
	constraint fk_valideve foreign key (eid) references Events(EventID)
);
INSERT INTO Attended 
VALUES ( 
	'bylder4',
	3
);
INSERT INTO Attended 
VALUES ( 
	'bylder4',
	1
);
INSERT INTO Attended 
VALUES ( 
	'virresh',
	3
);
INSERT INTO Attended 
VALUES ( 
	'virresh',
	1
);
INSERT INTO Attended 
VALUES ( 
	'virresh',
	2
);
INSERT INTO Attended 
VALUES ( 
	'ksandy',
	1
);
CREATE TABLE Achieved(
	acid int not null,
	user varchar(250),
	constraint fk_validachiev foreign key (acid) references Achievement(Aid),
	constraint fk_validperson foreign key (user) references Members(Username)
);
INSERT INTO Achieved 
VALUES ( 
	3,
	'ksandy'
);
INSERT INTO Achieved 
VALUES ( 
	1,
	'virresh'
);
INSERT INTO Achieved
VALUES ( 
	2,
	'virresh'
);
INSERT INTO Achieved
VALUES ( 
	2,
	'bylder4'
);