module predicates
open signatures
open functions

//d1 is later than d2
pred later_date[d1,d2: Date]{
    d2 in d1.comes_later_than
}

//does the university have multiple students?
pred multiple_students[un:University]{
    #un.University_students > 1
}

//does the intenship terminate correctly?
pred normal_development[i:Internship]{
    eventually i.state = Completed
}

//has the internship been interrupted?
pred interrupted[i:Internship]{
    eventually i.state = Interrupted
}