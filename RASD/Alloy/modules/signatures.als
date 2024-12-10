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

//internship signature, carries most of the information about the entire process
sig Internship {
    var state: one Status,
    var applicants: set Student, //applicants are the students that have applied and will recieve the Interview questionnaire
    var selected_student: lone Student,
    company: one Company,
    questionnaire: one Interview,
    deadline: one Date,
    var responses: set Student, //students that have responded to the Interview questionnaire
    duration: one WorkPeriod,
    Feedback: one Feedback
}

//work period of the internship
sig WorkPeriod{
    start: one Date,
    end: one Date
}
//generic questionnaire
abstract sig questionnaire{
    
}
//interview questionnaire for the selection phase
sig Interview extends questionnaire{
    
}

//feedback questionnaire for when the internship is completed without being cancelled
sig Feedback extends questionnaire{
    compiled_by: one Student
}
//TODO use somewhere
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
