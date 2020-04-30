from nssMember import NssMember

class Student(NssMember):
    def __init__(self, firstName, lastName, slackHandle, cohort):
        super().__init__(firstName, lastName, slackHandle, cohort)
        self.exerciseList = list()