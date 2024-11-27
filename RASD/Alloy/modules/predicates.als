open signatures

pred later_date[d1,d2: Date]{
    (d1.year > d2.year)
     or (d1.year = d2.year and d1.month > d2.month)
     or (d1.year = d2.year and d1.month = d2.month and d1.day > d2.day)
}