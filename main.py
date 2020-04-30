from cohort import Cohort
from exercise import Exercise
from instructor import Instructor
from student import Student

exercise_one = Exercise("Exercise One", "Python")
exercise_two = Exercise("Exercise Two", "Python")
exercise_three = Exercise("Exercise Three", "C#")
exercise_four = Exercise("Exercise Four", "C#")

cohort_one = Cohort("C37")
cohort_two = Cohort("C38")
cohort_three = Cohort("C39")
cohort_four = Cohort("C40")

student_one = Student("Jim", "Simmons", "@JimmySimms", cohort_one)
student_two = Student("Barb", "Wyer", "@BarbWyer", cohort_two)
student_three = Student("John", "Legend", "@LegendofJohn", cohort_three)
student_four = Student("Mack", "Williams", "@MackyWilly", cohort_four)

bryan_nilsen = Instructor("Bryan", "Nilsen", "@bnilsen", cohort_two, "high-fives")
andy_collins = Instructor("Andy", "Collins", "@andycollins", cohort_two, "sarcasm")
kristen_norris = Instructor("Kristen", "Norris", "@knorris", cohort_two, "correction other instructors' errors")
jisie_david = Instructor("Jisie", "David", "@jisiedavid", cohort_two, "spreading the positive attitude")
chase_fite = Instructor("Chase", "Fite", "@chasefite", cohort_two, "helping out students")

bryan_nilsen.assignExercise(exercise_one, student_one)
bryan_nilsen.assignExercise(exercise_four, student_one)

andy_collins.assignExercise(exercise_two, student_two)
andy_collins.assignExercise(exercise_three, student_two)

kristen_norris.assignExercise(exercise_one, student_three)
kristen_norris.assignExercise(exercise_three, student_three)

jisie_david.assignExercise(exercise_two, student_four)
jisie_david.assignExercise(exercise_four, student_four)