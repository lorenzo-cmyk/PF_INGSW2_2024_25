module predicates
open signatures
open functions

//d1 is later than d2
pred later_date[d1,d2: Date]{
    d2 in d1.later_than
}


//bo
pred multiple_students[un:University]{
    #un.University_students > 1
}

pred normal_development[i:Internship]{
    eventually i.state = Ended
}
