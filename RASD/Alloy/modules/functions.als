module functions

open signatures
 
fun Interview_responders[i:Internship] : set Student {  //test if it is correct
    i.responses.submitter
}

fun University_students[u:University] : set Student {
    {s:Student | s.uni = u}
}