module facts
open signatures
open predicates
open functions

//Internship facts

//deadline enforced
fact internship_deadline {
  all i: Internship | all r: i.responses | later_date[i.deadline, r.responseTime]
}

//no students form univerity that have blocked the company
fact blocked{
  all i: Internship | all st :i.applicants | i.company not in st.uni.blocked
}

//one response per student max
fact one_response_per_student {
  all i: Internship | no disj r1, r2: i.responses | (r1.submitter = r2.submitter 
  and r1.submitter in i.applicants 
  and r2.submitter in i.applicants)
}

fact selected_has_responded{
  all i: Internship | i.selected_student in i.Interview_responders
}
//status evolution
//bo non so come fare


//other facts

//for simplicity things like 31 february are allowed
fact date_format {
  all d: Date | d.year >= 0 and d.month >= 1 and d.month <= 12 and d.day >= 1 and d.day <= 31
}

fact intership_start_after_selection {
  all i: Internship | later_date[i.duration.start, i.deadline]
}
fact work_period_start_before_end {
  all wp: WorkPeriod | later_date[wp.end, wp.start]
}
