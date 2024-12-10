module functions

open signatures
//returns the students of a university
fun University_students[u:University] : set Student {
    {s:Student | s.uni = u}
}
//returns the internships of a company
fun company_internships[c:Company] : set Internship {
    {i:Internship | i.company = c}
}