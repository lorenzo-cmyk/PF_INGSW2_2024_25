open signatures

//for simplicity things like 31 february are allowed
fact date_format {
  all d: Date | d.year >= 0 and d.month >= 1 and d.month <= 12 and d.day >= 1 and d.day <= 31
}