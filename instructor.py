class Instructor:
    def __init__(self, firstName, lastName, handle, cohort, specialty):
        self.firstName = firstName
        self.lastName = lastName
        self.slackHandle = handle
        self.cohort = cohort
        self.specialty = specialty
    
    def assignExercise(self, exercise, student):
        student.exerciseList.append(exercise)
        print(f"{self.firstName} {self.lastName} assigns {exercise.name} to {student.firstName} {student.lastName}.")