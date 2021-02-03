CREATE TABLE classlist(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  instructor VARCHAR(200),
  classStatus VARCHAR (100),
  lotteryStatus VARCHAR (100),
  permission VARCHAR(200)
);
LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/classes.csv" INTO TABLE classlist
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, title, instructor, classStatus, lotteryStatus, permission);
DESCRIBE classlist;


ALTER TABLE classlist
ADD department varchar(4);

UPDATE classlist SET department=
SUBSTRING(name, 2,4);

CREATE TABLE CMSC(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  units VARCHAR(200),
  starttime INT,
  endtime INT,
  location VARCHAR(200),
  instructor VARCHAR(200),
  day VARCHAR(1)
);
LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/cs.csv" INTO TABLE CMSC
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name, title, instructor, starttime, endtime, location, instructor, day);

SELECT A.title AS firstClass, B.title AS secondClass
FROM CMSC A, CMSC B
WHERE (A.day<>B.day OR A.endTime<=B.starttime OR A.startTime>=B.endTime)AND 
A.name>'"CMSC B231 1' AND B.name>'"CMSC B231 1' AND A.name<>B.name;
 DROP TABLE CMSC;
 CREATE TABLE CMSC(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  units VARCHAR(200),
  starttime INT,
  endtime INT,
  location VARCHAR(200),
  instructor VARCHAR(200),
  day VARCHAR(1)
);
LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/cs.csv" INTO TABLE CMSC
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name, title, instructor, starttime, endtime, location, instructor, day);

SELECT A.title AS firstClass, B.title AS secondClass
FROM CMSC A, CMSC B
WHERE (A.day<>B.day OR A.endTime<=B.starttime OR A.startTime>=B.endTime)AND 
A.name>'"CMSC B231 1' AND B.name>'"CMSC B231 1' AND A.name<>B.name;

CREATE TABLE PSYCH(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  units VARCHAR(200),
  starttime INT,
  endtime INT,
  day VARCHAR(1),
  mode VARCHAR(200),
  instructor VARCHAR(200)
  );
SELECT *
FROM PSYCH;
  LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/psych.csv" INTO TABLE PSYCH
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name, title, units, starttime, endtime, day, mode, instructor);
SELECT *
FROM PSYCH;
SELECT *
FROM PSYCH C
where C.name>'PSYC B105-1';

CREATE TABLE DANCE(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  units VARCHAR(200),
  starttime INT,
  endtime INT,
  day VARCHAR(1),
  location VARCHAR(200),
  instructor VARCHAR(200)
  );

   LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/dance.csv" INTO TABLE DANCE
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

SELECT * 
FROM DANCE;
DROP TABLE classlist;

CREATE TABLE classlist(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  instructor VARCHAR(200),
  classStatus VARCHAR (100),
  lotteryStatus VARCHAR (100),
  permission VARCHAR(200)
);
DROP TABLE CMSC;

LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/classes.csv" INTO TABLE classlist
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, title, instructor, classStatus, lotteryStatus, permission);
DESCRIBE classlist;
ALTER TABLE classlist
ADD CMSC varchar(200);
ALTER TABLE classlist
ADD PSYCH varchar(200);
ALTER TABLE classlist
ADD DANCE varchar(200);
ALTER TABLE classlist
ADD department varchar(4);

UPDATE classlist SET department=
SUBSTRING(name, 2,4);
SELECT * 
from classlist;
CREATE TABLE CMSC(
  name VARCHAR(100) PRIMARY KEY,
  title VARCHAR(100),
  units VARCHAR(200),
  starttime INT,
  endtime INT,
  location VARCHAR(200),
  instructor VARCHAR(200),
  day VARCHAR(1)
);
LOAD DATA LOCAL INFILE "c:/Users/Acer/Desktop/cs.csv" INTO TABLE CMSC
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name, title, instructor, starttime, endtime, location, instructor, day);

SELECT * FROM CMSC;
SELECT * FROM classlist where department='CMSC' ;
UPDATE classlist SET name=
SUBSTRING(name, 2, LENGTH(name)-1);

UPDATE CMSC SET name=
SUBSTRING(name, 2, LENGTH(name)-1);

SELECT * from CMSC;

UPDATE CMSC SET name=
SUBSTRING(name, 1, LENGTH(name)-1);


 
      
