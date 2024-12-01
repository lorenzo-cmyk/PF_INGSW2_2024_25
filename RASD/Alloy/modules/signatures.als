module signatures
//actors
sig Student {
    uni : one University,
    internships: one Internship, //internship the student has participated in
    complaints: set Complaint
}

sig Company {
    internships: set Internship
}


sig University {
    blocked: set Company
}



sig Internship {
    state: one Status,
    applicants: set Student, //applicants are the students that have applied and will recieve the Interview questionnaire
    selected_student: one Student,
    company: one Company,
    questionnaire: one Interview,
    deadline: one Date,
    responses: set Response,
    duration: one WorkPeriod
}

sig Response{
    question: one Question,
    submitter: one Student,
    responseTime: one Date,
}

sig WorkPeriod{
    start: one Date,
    end: one Date
}
abstract sig questionnaire{
    questions: set Question
}
sig Interview extends questionnaire{
    
}
sig Feedback extends questionnaire{
    
}
sig Complaint{
    submitter: one Student,
    content: one String
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
