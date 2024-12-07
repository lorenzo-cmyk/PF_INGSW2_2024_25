module facts
open signatures
open predicates
open functions

//Internship facts

//deadline enforced

fact internship_deadline {
  all i: Internship | all r: i.responses | later_date[r.responseTime, i.deadline]
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

fact breathing_room{
  all i: Internship | later_date[i.duration.start, i.deadline]
}

fact work_period_start_before_end {
  all wp: WorkPeriod | later_date[wp.end, wp.start]
}
fact responses_persist{
  all i: Internship | all r: i.responses | eventually r in i.responses implies always after r in i.responses
}

fact one_company_per_internship{
  all c1,c2 :Company | (c1 != c2) implies c1.internships & c2.internships = none
}

//total ordering on dates
fact antisymmetry{
	all d1,d2:Date |  d1 in d2.later_than  implies d2 not in d1.later_than
}

fact transitivity{
	all d1,d2,d3 :Date | (d1 in d2.later_than and d2 in d3.later_than) implies d1 in d3.later_than
 }

fact  total_order{
all  d1, d2 : Date |d1 != d2 implies  ( d1 in d2.later_than or d2  in d1.later_than)
}
