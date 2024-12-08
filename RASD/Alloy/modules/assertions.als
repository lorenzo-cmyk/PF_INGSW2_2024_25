module assertions
open signatures
open functions


//the responses are form applied students
assert response_cardinality{
    all i: Internship | #i.applicants >= #i.responses
}

assert ongoing_check{
    all i: Internship | i.state = Ongoing implies i.applicants != none and i.responses != none
}
