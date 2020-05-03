-- Creating 5 tables, including one join-table for many-to-many relationship.
CREATE TABLE cohort (
	id	   		 INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	cohortName   TEXT NOT NULL UNIQUE
);

CREATE TABLE student (
	id 	   		INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	firstName	TEXT NOT NULL,
	lastName	TEXT NOT NULL,
	slackHandle TEXT NOT NULL UNIQUE,
	cohortId	INTEGER NOT NULL,
	FOREIGN KEY(cohortId) REFERENCES cohort(id)
);

CREATE TABLE instructor (
	id 	   		INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	firstName	TEXT NOT NULL,
	lastName	TEXT NOT NULL,
	slackHandle TEXT NOT NULL UNIQUE,
	cohortId	INTEGER,
	FOREIGN KEY(cohortId) REFERENCES cohort(id)
);

CREATE TABLE exercise (
	id	           INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	exerciseName   TEXT NOT NULL UNIQUE,
	codeLanguage   TEXT NOT NULL
);

CREATE TABLE studentExercises (
	id	        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	studentId	INTEGER,
	exerciseId	INTEGER,
	FOREIGN KEY(studentId) REFERENCES student(id),
	FOREIGN KEY(exerciseId) REFERENCES exercise(id)
);

-- Creating 3 cohorts in the cohort table.
INSERT INTO cohort (cohortName)
VALUES ("Cohort 38");

INSERT INTO cohort (cohortName)
VALUES ("Cohort 37");

INSERT INTO cohort (cohortName)
VALUES ("Cohort 36");

-- Creating some exercises.
INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise One", "Python");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Two", "Python");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Three", "SQL");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Four", "SQL");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Five", "Python");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Six", "JavaScript");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Seven", "JavaScript");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Eight", "C#");

INSERT INTO exercise (exerciseName, codeLanguage)
VALUES ("Exercise Nine", "C#");

-- Adding 3 instructors to the instructor table.
INSERT INTO instructor (firstName, lastName, slackHandle, cohortId)
VALUES ("Jisie", "David", "@jisiedavid", (SELECT id from cohort WHERE cohortName="Cohort 38"));

INSERT INTO instructor (firstName, lastName, slackHandle, cohortId)
VALUES ("Andy", "Collins", "@andycollins", (SELECT id from cohort WHERE cohortName="Cohort 36"));

INSERT INTO instructor (firstName, lastName, slackHandle, cohortId)
VALUES ("Kristen", "Norris", "@knorris", (SELECT id from cohort WHERE cohortName="Cohort 38"));

-- Creating 7 students in the students table
INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("Andrew", "Green", "@andrewgreen", (SELECT id from cohort WHERE cohortName="Cohort 38"));

INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("Jim", "Simmons", "@jimmy", (SELECT id from cohort WHERE cohortName="Cohort 37"));

INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("Cooper", "Nichols", "@heycoop", (SELECT id from cohort WHERE cohortName="Cohort 38"));

INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("Tyler", "Simeone", "@tylersimeone", (SELECT id from cohort WHERE cohortName="Cohort 38"));

INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("Barb", "Wyer", "@barbwyer", (SELECT id from cohort WHERE cohortName="Cohort 36"));

INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("John", "Legend", "@johnny", (SELECT id from cohort WHERE cohortName="Cohort 37"));

INSERT INTO student (firstName, lastName, slackHandle, cohortId)
VALUES ("Michael", "Clark", "@mikey", (SELECT id from cohort WHERE cohortName="Cohort 38"));

-- Assigning two exercises to each student.
INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Andrew" AND lastName="Green"), (SELECT id from exercise WHERE exerciseName="Exercise One"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Andrew" AND lastName="Green"), (SELECT id from exercise WHERE exerciseName="Exercise Two"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Jim" AND lastName="Simmons"), (SELECT id from exercise WHERE exerciseName="Exercise Two"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Jim" AND lastName="Simmons"), (SELECT id from exercise WHERE exerciseName="Exercise Four"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Cooper" AND lastName="Nichols"), (SELECT id from exercise WHERE exerciseName="Exercise One"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Cooper" AND lastName="Nichols"), (SELECT id from exercise WHERE exerciseName="Exercise Two"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Tyler" AND lastName="Simeone"), (SELECT id from exercise WHERE exerciseName="Exercise Two"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Tyler" AND lastName="Simeone"), (SELECT id from exercise WHERE exerciseName="Exercise Three"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Barb" AND lastName="Wyer"), (SELECT id from exercise WHERE exerciseName="Exercise Three"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Barb" AND lastName="Wyer"), (SELECT id from exercise WHERE exerciseName="Exercise Four"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Barb" AND lastName="Wyer"), (SELECT id from exercise WHERE exerciseName="Exercise Three"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="John" AND lastName="Legend"), (SELECT id from exercise WHERE exerciseName="Exercise One"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="John" AND lastName="Legend"), (SELECT id from exercise WHERE exerciseName="Exercise Four"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Michael" AND lastName="Clark"), (SELECT id from exercise WHERE exerciseName="Exercise Two"));

INSERT INTO studentExercises (studentId, exerciseId)
VALUES ((SELECT id from student WHERE firstName="Michael" AND lastName="Clark"), (SELECT id from exercise WHERE exerciseName="Exercise Three"));