module predicates
open signatures
open functions

//d1 is later than d2
pred later_date[d1,d2: Date]{
    (d1.year > d2.year)
     or (d1.year = d2.year and d1.month > d2.month)
     or (d1.year = d2.year and d1.month = d2.month and d1.day > d2.day)
}


//bo
pred multiple_students[un:University]{
    #un.University_students > 1
}

pred normal_development[i:Internship]{
    eventually i.state = Ended
}

pred comes_before[d1,d2:Date]{
    d2 in d1.is_before
}