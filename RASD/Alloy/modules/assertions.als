module assertions
open signatures
open functions


//the responses are form applied students
assert response_cardinality{
    all i: Internship | #i.applicants >= #i.responses
}