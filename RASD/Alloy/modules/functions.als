module functions

open signatures

fun University_students[u:University] : set Student {
    {s:Student | s.uni = u}
}

fun company_internships[c:Company] : set Internship {
    {i:Internship | i.company = c}
}