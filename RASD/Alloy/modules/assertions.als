module assertions
open signatures
open functions


//the responses are form applied students
assert response_cardinality{
    always all i: Internship | #i.applicants >= #i.responses
}

assert ongoing_check{
    all i: Internship | i.state = Ongoing implies i.applicants != none and i.responses != none
}


assert process_end{
    eventually all i: Internship | i.state = Completed or i.state = Terminated
}

assert valid_applicants{
    all i: Internship | all a: i.applicants | a in Student
}
