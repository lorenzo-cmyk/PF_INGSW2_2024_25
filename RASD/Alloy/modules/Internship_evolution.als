open signatures

//forces the initial state of every intership to be "Created"
fact begin{
    always some i: Internship | i.state != Created implies once i.state = Created
}


//temporal evolution of the internship state
fact evolution{
    always some i:Internship | i.state = Created implies eventually i.state = Selecting
    always some i:Internship | i.state = Selecting implies eventually i.state = Ongoing
    always some i:Internship | i.state = Ongoing implies eventually (i.state = Ended or i.state = Interrupted)
    always some i:Internship | i.state = Ended  implies i.state' = Ended
    always some i:Internship | i.state = Interrupted  implies eventually (i.state' = Terminated or i.state' = Ongoing)
}

fact uninitialized_applications{
    always some i: Internship | i.state = Created implies (i.applicants = none and i.selected_student = none)
}
fact uninitialized_responses{
    always some i: Internship | i.state = Created implies i.responses = none
}

fact ongoing_means_selected{
    always some i: Internship | i.state = Ongoing implies i.selected_student != none
}