module signatures
//actors
sig Student {
    uni : one University,
    //TODO check internships: one Internship, //internship the student has participated in
    complaints: set Complaint
}

sig Company {
    
}


sig University {
    blocked: set Company
}



sig Internship {
    var state: one Status,
    var applicants: set Student, //applicants are the students that have applied and will recieve the Interview questionnaire
    var selected_student: lone Student,
    company: one Company,
    questionnaire: one Interview,
    deadline: one Date,
    var responses: set Student, //students that have responded to the Interview questionnaire
    duration: one WorkPeriod
}


sig WorkPeriod{
    start: one Date,
    end: one Date
}
abstract sig questionnaire{
    
}
sig Interview extends questionnaire{
    
}
sig Feedback extends questionnaire{
    
}
sig Complaint{
    submitter: one Student,
    content: one String
}
//utils

//dates for temporal properties
sig Date{
    comes_later_than: set Date
}


//statuses for internships
abstract sig Status{

}

one sig Created, Open, Selecting, Ongoing, Completed, Interrupted, Terminated extends Status{

}
