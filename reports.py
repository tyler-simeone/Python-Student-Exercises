import sqlite3

class StudentExerciseReports():

    """Methods for reports on the Student Exercises database"""

    def __init__(self):
        self.db_path = "/Users/tyler/backend-workspace/StudentExercises/studentexercises.db"

    def all_students(self):

        """Retrieve all students with the cohort name"""
        # Making a connection with sqlite disk server with the path to my .db file
        with sqlite3.connect(self.db_path) as conn:
            db_cursor = conn.cursor()

            # goes to sql db file to execute this sql code block
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

            all_students = db_cursor.fetchall()

            # all_students is going to return a list of tuples, where each tuple is
            # a row in the db. So in each tuple/row grab the 2nd, 3rd and 6th columns
            # to print.
            for student in all_students:
                print(f"{student[1]} {student[2]} is in {student[5]}")

reports = StudentExerciseReports()
reports.all_students()