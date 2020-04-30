from nssMember import NssMember

class Instructor(NssMember):
    def __init__(self, firstName, lastName, slackHandle, cohort, specialty):
        super().__init__(firstName, lastName, slackHandle, cohort)
        self.specialty = specialty        
    
    def assignExercise(self, exercise, student):
        student.exerciseList.append(exercise)
        print(f"{self.firstName} {self.lastName} assigns {exercise.name} to {student.firstName} {student.lastName}.")