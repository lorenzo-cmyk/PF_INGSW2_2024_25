module Internship_evolution
open signatures
open functions

//forces the initial state of every intership to be "Created"
fact begin{
    always some i: Internship | i.state != Created implies once i.state = Created
}


//temporal evolution of the internship state
//states represent a snapshot of the intersnhip right before the transition to the next state
fact evolution{
    always all i:Internship | i.state = Created implies  i.state' = Open
    always all i:Internship | i.state = Open implies  i.state' = Selecting
    always all i:Internship | i.state = Selecting implies  i.state' = Ongoing
    always all i:Internship | i.state = Ongoing implies (i.state' = Completed or i.state' = Interrupted)
    always all i:Internship | i.state = Completed  implies i.state' = Completed
    always all i:Internship | i.state = Interrupted  implies (i.state' = Terminated or i.state' = Ongoing)
    always all i:Internship | i.state = Terminated  implies i.state' = Terminated
}

fact Created_is_uninitialized_state{
    always some i: Internship | i.state = Created implies (i.applicants = none and i.selected_student = none and i.responses = none)
}
//possible values of variables in states
fact Open_is_only_for_applying{
    always some i: Internship | i.state = Open implies (i.responses = none and i.selected_student = none and i.applicants != none)
}
fact Selecting_is_for_interviews{
    always some i: Internship | i.state = Selecting implies (i.responses != none and i.selected_student = none) //applicants will be none because of persistence
}
fact Ongoing_means_selected{
    always some i: Internship | i.state = Ongoing implies i.selected_student != none
}

//variable updates and persistance
fact responders_are_applicants{
    always all i:Internship | i.responses in i.applicants
}
fact Apply_only_when_open{
    always all i:Internship | (i.state != Created ) implies i.applicants = i.applicants' //the only transition that can change the applicants is the one from Created to Open
}
fact Respond_only_when_selecting{
    always all i:Internship | (i.state != Open ) implies i.responses = i.responses' //the only transition that can change the responses is the one from Open to Selecting
}
fact Select_only_before_Ongoing{
    always all i:Internship | (i.state != Selecting ) implies i.selected_student = i.selected_student' //the only transition that can change the selected_student is the one from Selecting to Ongoing
}

fact selected_has_responded{
  always all i: Internship | i.selected_student = none or i.selected_student in i.responses
}