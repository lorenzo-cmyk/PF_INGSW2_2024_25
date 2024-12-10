module facts
open signatures
open predicates
open functions

//Internship facts

//the studnet can't apply to internship if the company is blocked by the company
fact blocked{
  all i: Internship | all st :i.applicants | i.company not in st.uni.blocked
}

//the work period starts later than the deadline
fact breathing_room{
  all i: Internship | later_date[i.duration.start, i.deadline]
}

//the work period ends later than the start
fact work_period_start_before_end {
  all wp: WorkPeriod | later_date[wp.end, wp.start]
}

//each internhips is offered by one company
fact one_company_per_internship{
  all c1,c2 :Company | (c1 != c2) implies c1.company_internships & c2.company_internships = none
}

//total ordering on dates
fact antisymmetry{
	all d1,d2:Date |  d1 in d2.comes_later_than  implies d2 not in d1.comes_later_than
}
fact transitivity{
	all d1,d2,d3 :Date | (d1 in d2.comes_later_than and d2 in d3.comes_later_than) implies d1 in d3.comes_later_than
 }
fact  total_order{
all  d1, d2 : Date |d1 != d2 implies  ( d1 in d2.comes_later_than or d2  in d1.comes_later_than)
}
fact no_reflexivity{
  all d:Date | d not in d.comes_later_than
}

