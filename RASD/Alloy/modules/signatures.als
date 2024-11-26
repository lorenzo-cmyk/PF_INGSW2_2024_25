module signatures

sig Student {
    
}

sig Company {
    internships: set Intership
}

sig Intership {
    student: set Student,
    company: one Company
}