module signatures
//actors
sig Student {
    uni : one University,

}

sig Company {
    internships: set Intership

}


sig University {
    students: set Student,
    blocked: set Company
}



sig Intership {
    state: one Status,
    applicants: set Student,
    selected_student: one Student,
    company: one Company,
    questionnaire: one Interview,
    deadline: one Date,
}

abstract sig questionnaire{
    questions: set Question
}
sig Interview extends questionnaire{
    
}
sig Feedback extends questionnaire{
    
}
//is it useful?
sig Question{

}


//utils

//dates for temporal properties
sig Date{
    day: Int,
    month: Int,
    year: Int
}

//statuses for internships
abstract sig Status{

}
one sig Open, Selecting, Ongoing, Completed, Interrupted, Closed extends Status{

}
