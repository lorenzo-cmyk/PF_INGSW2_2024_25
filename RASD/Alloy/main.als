open modules/signatures 
open modules/facts
open modules/predicates
open modules/functions
open modules/assertions
open modules/Internship_evolution

pred show[i:Internship]{
    once i.state = Created
}
pred show_Int[i:Internship]{
    some i: Internship | eventually i.state = Ended and eventually #i.applicants > 1
}

//run normal_development for 5 but exactly 1 Internship, 5 steps
run show_Int for 5 but exactly 1 Internship,3 Student, 5 steps
