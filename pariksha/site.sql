PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE user (
	id INTEGER NOT NULL, 
	name VARCHAR(20) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	password VARCHAR(50) NOT NULL, 
	verified BOOLEAN NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (email), 
	CHECK (verified IN (0, 1))
);
INSERT INTO user VALUES(1,'Raman Verma','student@gmail.com','$2b$12$jJT7PAmW8z7rNahMQxyIn.HdsMlNs2bWIL8pFbzmXMOmC9ruygnvK',1);
INSERT INTO user VALUES(2,'Adarsh Banka','teacher@gmail.com','$2b$12$pR3Oqd/K7tHS7IcD7haZYO.6RofOTj8fxF4PxpIKqbK2d8wHB39ZS',1);
INSERT INTO user VALUES(3,'Chirag Saxena','student1@gmail.com','$2b$12$uyx7FWI3rvax9gzuF2Kudu9tWzZydFG7McjwSeCwX7BEaSoFtcjF.',1);
INSERT INTO user VALUES(4,'Manan Tiwari','student2@gmail.com','$2b$12$kEooJZsqugNW6YUAEcvL/.QI6k/wNUMilP7XxJ2XYa0p26xvGqade',1);
INSERT INTO user VALUES(5,'Sid Jain','student3@gmail.com','$2b$12$R0VzFg9ml7C8jsSM2LeYpOFdJzuKLreHGgMgDp4pPQR1tuSo5LGNW',1);
INSERT INTO user VALUES(6,'Apurva Lal','student4@gmail.com','$2b$12$XajJYdvS5Q6QuaVvKILskuHwEO6TQCLy2.k0SRuwsm/i7A1nKPpGm',1);
INSERT INTO user VALUES(7,'Rohit Shetty','student5@gmail.com','$2b$12$TQBQ4pPt4ZQa6auYUWn0k.JJ9x.aop6uOGswpSnzv.Tf1/AYeNaOW',1);
INSERT INTO user VALUES(8,'Govind Nath','student6@gmail.com','$2b$12$5mMNuMWoW5G0TzRS5avrkeAK/KQM6/FTsbd4txOD4zxcan5E3c70a',1);
CREATE TABLE student (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
INSERT INTO student VALUES(1,1);
INSERT INTO student VALUES(2,3);
INSERT INTO student VALUES(3,4);
INSERT INTO student VALUES(4,5);
INSERT INTO student VALUES(5,6);
INSERT INTO student VALUES(6,7);
INSERT INTO student VALUES(7,8);
CREATE TABLE teacher (
	id INTEGER NOT NULL, 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
);
INSERT INTO teacher VALUES(1,2);
CREATE TABLE teaches (
	student_id INTEGER, 
	teacher_id INTEGER, 
	FOREIGN KEY(student_id) REFERENCES student (id), 
	FOREIGN KEY(teacher_id) REFERENCES teacher (id)
);
INSERT INTO teaches VALUES(1,1);
INSERT INTO teaches VALUES(2,1);
INSERT INTO teaches VALUES(3,1);
INSERT INTO teaches VALUES(4,1);
INSERT INTO teaches VALUES(5,1);
INSERT INTO teaches VALUES(6,1);
INSERT INTO teaches VALUES(7,1);
CREATE TABLE assignment (
	id INTEGER NOT NULL, 
	title VARCHAR(30) NOT NULL, 
	start_time DATETIME NOT NULL, 
	end_time DATETIME NOT NULL, 
	time_created DATETIME NOT NULL, 
	teacher_id INTEGER, 
	marks INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(teacher_id) REFERENCES teacher (id)
);
CREATE TABLE quiz (
	id INTEGER NOT NULL, 
	title VARCHAR(30) NOT NULL, 
	start_time DATETIME NOT NULL, 
	end_time DATETIME NOT NULL, 
	active BOOLEAN NOT NULL, 
	time_created DATETIME NOT NULL, 
	teacher_id INTEGER, 
	marks INTEGER, 
	PRIMARY KEY (id), 
	CHECK (active IN (0, 1)), 
	FOREIGN KEY(teacher_id) REFERENCES teacher (id)
);
INSERT INTO quiz VALUES(1,'Simple Maths','2020-11-17 00:00:00.000000','2020-12-17 23:59:59.000000',1,'2020-11-17 22:34:45.682910',1,11);
INSERT INTO quiz VALUES(2,'Simple Maths-2','2020-11-17 00:00:00.000000','2020-12-17 23:59:59.000000',1,'2020-11-17 22:37:25.098681',1,12);
INSERT INTO quiz VALUES(3,'Simple Maths-3','2020-11-17 00:00:00.000000','2020-12-17 23:59:59.000000',1,'2020-11-17 22:40:10.208201',1,19);
CREATE TABLE assignment__questions (
	id INTEGER NOT NULL, 
	question_desc VARCHAR(700) NOT NULL, 
	marks INTEGER, 
	option_1 VARCHAR(400) NOT NULL, 
	option_2 VARCHAR(400) NOT NULL, 
	option_3 VARCHAR(400) NOT NULL, 
	option_4 VARCHAR(400) NOT NULL, 
	assignment_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(assignment_id) REFERENCES assignment (id)
);
CREATE TABLE submits_assign (
	student_id INTEGER, 
	assignment_id INTEGER, 
	time_submitted DATETIME NOT NULL, 
	marks INTEGER, 
	FOREIGN KEY(student_id) REFERENCES student (id), 
	FOREIGN KEY(assignment_id) REFERENCES assignment (id)
);
CREATE TABLE quiz__questions (
	id INTEGER NOT NULL, 
	question_desc VARCHAR(700) NOT NULL, 
	marks INTEGER, 
	option_1 VARCHAR(400) NOT NULL, 
	option_2 VARCHAR(400) NOT NULL, 
	option_3 VARCHAR(400) NOT NULL, 
	option_4 VARCHAR(400) NOT NULL, 
	quiz_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(quiz_id) REFERENCES quiz (id)
);
INSERT INTO quiz__questions VALUES(1,'13+5?',3,'18','-18','12','0',1);
INSERT INTO quiz__questions VALUES(2,'12-12?',2,'0','24','14','3',1);
INSERT INTO quiz__questions VALUES(3,'10+9?',3,'19','15','12','3',1);
INSERT INTO quiz__questions VALUES(4,'14-9?',3,'5','6','7','8',1);
INSERT INTO quiz__questions VALUES(5,'1*3?',5,'3','1','-3','0',2);
INSERT INTO quiz__questions VALUES(6,'14+6?',1,'20','2','8','56',2);
INSERT INTO quiz__questions VALUES(7,'23+9?',2,'31','12','11','14',2);
INSERT INTO quiz__questions VALUES(8,'5+5-5?',4,'5','0','55','555',2);
INSERT INTO quiz__questions VALUES(9,'11+5?',2,'16','14','6','2',3);
INSERT INTO quiz__questions VALUES(10,'85+4-6?',5,'83','85','87','8',3);
INSERT INTO quiz__questions VALUES(11,'45+9?',2,'54','5','3','2',3);
INSERT INTO quiz__questions VALUES(12,'6*6?',6,'36','12','0','6',3);
INSERT INTO quiz__questions VALUES(13,'5*9?',4,'45','4','5','54',3);
CREATE TABLE submits_quiz (
	student_id INTEGER, 
	quiz_id INTEGER, 
	time_submitted DATETIME NOT NULL, 
	marks INTEGER, 
	FOREIGN KEY(student_id) REFERENCES student (id), 
	FOREIGN KEY(quiz_id) REFERENCES quiz (id)
);
INSERT INTO submits_quiz VALUES(1,1,'2020-11-18 21:50:20.348613',6);
COMMIT;
