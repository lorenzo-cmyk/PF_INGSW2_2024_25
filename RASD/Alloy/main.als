open modules/signatures 
open modules/facts
open modules/predicates
open modules/functions
open modules/assertions
open modules/Internship_evolution

pred show_Comp[i:Internship]{
    some i: Internship | eventually i.state = Completed and eventually #i.applicants > 1
}
pred show_Int[i:Internship]{
    some i: Internship | eventually i.state = Terminated and eventually #i.applicants > 1
}
pred resume_after_Int[i:Internship]{
    some i: Internship | eventually i.state = Interrupted and  eventually i.state =Completed and eventually #i.applicants > 1
}

run show_Comp for 5 but exactly 1 Internship,3 Student, 6 steps
run show_Int for 5 but exactly 1 Internship,3 Student, 6 steps

run resume_after_Int for 5 but exactly 1 Internship,3 Student, 7 steps