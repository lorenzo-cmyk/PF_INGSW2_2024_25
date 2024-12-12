module assertions
open signatures
open functions


//check the total number of applications recieved
assert response_cardinality{
    always all i: Internship | #i.applicants >= #i.responses
}

//check for non emptiness
assert ongoing_check{
    all i: Internship | i.state = Ongoing implies i.applicants != none and i.responses != none
}

//no internships gets stuck without a way to progress
assert process_end{
    eventually all i: Internship | i.state = Completed or i.state = Terminated
}

//check for valid applicants (students that are not blocked by the company)
assert valid_applicants{
    all i: Internship | all a: i.applicants | a in Student and i.company not in a.uni.blocked 
}

//check for valid responses (students that are not blocked by the company)
assert valid_responses{
    all i: Internship | all r: i.responses | r in i.applicants and r in Student and i.company not in r.uni.blocked
}
