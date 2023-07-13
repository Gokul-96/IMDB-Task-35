--  1. Movie should have multiple media(Video or Image) 
--  2. Movie can belongs to multiple Genre 
--  3. Movie can have multiple reviews and Review can belongs to a user
--  4. Artist can have multiple skills 
--  5. Artist can perform multiple role in a single film



show databases;

Create database IMDB1;

Use IMDB1;

Create table Movie(
MOVIE_ID INT PRIMARY KEY NOT NULL,
MOVIE_NAME VARCHAR(255) NOT NULL
);
alter table Movie modify MOVIE_ID VARCHAR(222);
describe Movie;

insert into Movie(MOVIE_ID,MOVIE_NAME) values ( 'Mov_1', 'Titanic');
insert into Movie(MOVIE_ID,MOVIE_NAME) values ( 'Mov_2', 'Fastx');
insert into Movie(MOVIE_ID,MOVIE_NAME) values ( 'Mov_3', 'Avatar');

select * from  Movie;

create table Multiple_Media(
MOVIE_ID VARCHAR(255) not null,
Multiple_Media_ID int primary key not null,
MEDIA_TYPE VARCHAR(255) not null,
URL VARCHAR(255) not null,
foreign key(MOVIE_ID)references Movie(MOVIE_ID)
);
describe Multiple_Media;

insert into Multiple_Media(MOVIE_ID,Multiple_Media_ID,MEDIA_TYPE,URL) values ('Mov_1','1', 'Video','https://www.imdb.com/video/vi1740686617/?ref_=tt_vi_i_1');
insert into Multiple_Media(MOVIE_ID,Multiple_Media_ID,MEDIA_TYPE,URL) values ('Mov_1','2', 'Image','https://www.imdb.com/title/tt0120338/mediaviewer/rm2647458304/?ref_=tt_ov_i');
insert into Multiple_Media(MOVIE_ID,Multiple_Media_ID,MEDIA_TYPE,URL) values ('Mov_2','3', 'Video','https://www.imdb.com/video/vi2052375577/?ref_=tt_vi_i_1');
insert into Multiple_Media(MOVIE_ID,Multiple_Media_ID,MEDIA_TYPE,URL) values ('Mov_2','4', 'Image','https://www.imdb.com/title/tt5433140/mediaviewer/rm2554213633/?ref_=tt_ov_i');
insert into Multiple_Media(MOVIE_ID,Multiple_Media_ID,MEDIA_TYPE,URL) values ('Mov_3','5', 'Video','https://www.imdb.com/video/vi531039513/?ref_=tt_vi_i_1');
insert into Multiple_Media(MOVIE_ID,Multiple_Media_ID,MEDIA_TYPE,URL) values ('Mov_3','6', 'Image','https://www.imdb.com/title/tt0499549/mediaviewer/rm2864126209/?ref_=tt_ov_i');

select * from  Multiple_Media;

---------------------------------------------------------------------

CREATE TABLE Genere(
GENRE_ID VARCHAR(255),
TYPE VARCHAR(255)
);

alter table Genere add primary key(GENRE_ID);

describe Genere;


insert into Genere(GENRE_ID ,TYPE) values(1,'Romance');
insert into Genere(GENRE_ID ,TYPE) values(2,'Drama');
insert into Genere(GENRE_ID ,TYPE) values(3,'Drama');
insert into Genere(GENRE_ID ,TYPE) values(4,'Triller');
insert into Genere(GENRE_ID ,TYPE) values(5,'Fantasy');
insert into Genere(GENRE_ID ,TYPE) values(6,'Romance');


select * from  Genere;


create table Movie_Genre(
MOVIE_ID VARCHAR(255) not null,
GENRE_ID VARCHAR(255) not null,

foreign key(MOVIE_ID)references Movie(MOVIE_ID),
foreign key (GENRE_ID) references GENERE(GENRE_ID)
);

describe Movie_Genre;

insert into Movie_Genre(MOVIE_ID,GENRE_ID) values('Mov_2',3);
insert into Movie_Genre(MOVIE_ID,GENRE_ID) values('Mov_2',4);

select * from  Movie_Genre;

-- -------------------------------------------------------------------

CREATE TABLE Review(
REVIEW_ID INT PRIMARY KEY NOT NULL ,
MOVIE_ID VARCHAR(255) not null,
USER_NAME varchar(30) not null,
REVIEW_TYPE VARCHAR(255) NOT NULL,
foreign key(MOVIE_ID)references Movie(MOVIE_ID)
);

insert into Review(REVIEW_ID,MOVIE_ID,USER_NAME ,REVIEW_TYPE) values (1,'Mov_1','Gokul','Good');
insert into Review(REVIEW_ID,MOVIE_ID,USER_NAME ,REVIEW_TYPE) values (2,'Mov_1','kanmani','Bad');
insert into Review(REVIEW_ID,MOVIE_ID,USER_NAME ,REVIEW_TYPE) values (3,'Mov_1','Tera','Excellent');

select * from  Review;


-------------------------------------------------------------------


CREATE TABLE ARTIST
(
ID INT PRIMARY KEY NOT NULL,
ARTIST_NAME VARCHAR(255) NOT NULL
);

describe artist;
 
insert into ARTIST(ID,ARTIST_NAME) values (1,'Leonardo Dicaprio');
insert into ARTIST(ID,ARTIST_NAME) values (2,'Kate Winslet');

select * from  ARTIST;



CREATE TABLE SKILLS
(
SKILL_ID INT PRIMARY KEY NOT NULL,
ID INT not null,
SKILL_TYPE VARCHAR(255) NOT NULL,
foreign key (ID) references ARTIST(ID)
);

insert into SKILLS(SKILL_ID,ID,SKILL_TYPE) values (1,1,'Actor');
insert into SKILLS(SKILL_ID,ID,SKILL_TYPE) values (2,2,'Actress');
insert into SKILLS(SKILL_ID,ID,SKILL_TYPE) values (3,1,'Director');
insert into SKILLS(SKILL_ID,ID,SKILL_TYPE) values (4,2,'Producer');

select * from  SKILLS;


CREATE TABLE ARTIST_SKILLS
(
ARTIST_SKILLS_ID INT PRIMARY KEY NOT NULL,
ID INT,
SKILL_ID INT NOT NULL,
foreign key (ID) references ARTIST(ID),
foreign key (SKILL_ID) references SKILLS(SKILL_ID)
);

insert into ARTIST_SKILLS(ARTIST_SKILLS_ID,ID,SKILL_ID) values (1,1,1);
insert into ARTIST_SKILLS(ARTIST_SKILLS_ID,ID,SKILL_ID) values (2,2,3);
insert into ARTIST_SKILLS(ARTIST_SKILLS_ID,ID,SKILL_ID) values (3,1,2);
insert into ARTIST_SKILLS(ARTIST_SKILLS_ID,ID,SKILL_ID) values (4,2,4);

select * from  ARTIST_SKILLS;
-----------------------------------------------------------------------------


CREATE TABLE ROLE(
ROLE_ID INT PRIMARY KEY NOT NULL,
MOVIE_ID VARCHAR(255),
ID INT NOT NULL,
No_of_ROLE  INT NOT NULL,
foreign key(MOVIE_ID)references Movie(MOVIE_ID),
foreign key (ID) references ARTIST(ID)
);

insert into ROLE(ROLE_ID,MOVIE_ID,ID,No_of_ROLE) values (1,'Mov_1',1,4);
insert into ROLE(ROLE_ID,MOVIE_ID,ID,No_of_ROLE) values (2,'Mov_1',2,3);

select * from  ROLE;
 