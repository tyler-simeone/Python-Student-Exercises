import sqlite3

class Student():
    def __init__(self, first, last, handle, cohort):
        self.first_name = first
        self.last_name = last
        self.slack_handle = handle
        self.cohort = cohort

    def __repr__(self):
        return f'{self.first_name} {self.last_name} is in {self.cohort}'

class Cohort():
    def __init__(self, name):
        self.cohortName = name

    def __repr__(self):
        return f'{self.cohortName}'

class Exercise():
    def __init__(self, name, language):
        self.exerciseName = name
        self.codeLanguage = language

    def __repr__(self):
        return f'Exercise: {self.exerciseName} Language used: {self.codeLanguage}'

class StudentExerciseReports():

    """Methods for reports on the Student Exercises database"""

    def __init__(self):
        self.db_path = "/Users/tyler/backend-workspace/StudentExercises/studentexercises.db"

    def all_students(self):

        """Retrieve all students with the cohort name"""
        # Making a connection with sqlite disk server with the path to my .db file
        with sqlite3.connect(self.db_path) as conn:
            
            # Had to put this line above db_cursor to get it to work.
            # Returns a student obj from Student class for each row of data returned
            # from fetchall(), with specified index positions.
            conn.row_factory = lambda cursor, row: Student(
                row[1], row[2], row[3], row[5]
            )

            db_cursor = conn.cursor()

            db_cursor.execute("""
            SELECT student.id,
                student.firstName,
                student.lastName,
                student.slackHandle,
                student.cohortId,
                cohort.cohortName
            FROM student
            JOIN cohort ON student.cohortId = cohort.id
            ORDER BY student.cohortId
            """)
            # Now returns list of student objects thanks to Student class 
            # and create_student() function and conn.row_factory
            all_students = db_cursor.fetchall()

            for student in all_students:
                print(student)

            # Same as above but in list comprehension format
            # [print(s) for s in all_students]

    def all_cohorts(self):

        """Retrieve all cohorts and display cohort name"""

        # Making a connection with sqlite disk server with the path to my .db file
        with sqlite3.connect(self.db_path) as conn:
            # Making a cohort obj instance for each row in Cohort table
            conn.row_factory = lambda cursor, row: Cohort(
                row[1]
            )
            db_cursor = conn.cursor()

            db_cursor.execute("""
            SELECT cohort.id, cohort.cohortName
            FROM cohort
            ORDER BY cohort.id
            """)

            all_cohorts = db_cursor.fetchall()

            for cohort in all_cohorts:
                print(cohort)

            # Same as above but in list comprehension format
            # [print(s) for s in all_students]

    def all_exercises(self):

        """Retrieve all exercises with exercise name and 
        code language used"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Exercise(
                row[1], row[2]
            )
            db_cursor = conn.cursor()

            db_cursor.execute("""
            SELECT exercise.id,
                exercise.exerciseName,
                exercise.codeLanguage
            FROM exercise
            ORDER BY exercise.id
            """)

            all_exercises = db_cursor.fetchall()

            for exercise in all_exercises:
                print(exercise)

            # Same as above but in list comprehension format
            # [print(s) for s in all_students]

reports = StudentExerciseReports()
# reports.all_students()
# reports.all_cohorts()
# reports.all_exercises()