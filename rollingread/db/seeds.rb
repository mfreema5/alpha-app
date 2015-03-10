Semester.create!([
  {short_semester: "S15", full_semester: "Spring 15", start_date: "2015-01-12", end_date: "2015-05-02"}
])
Course.create!([
  {course_number: "COM531", short_course: "Web Apps", full_course: "Web Application Development", meet_days: 2, semester_id: 1},
  {course_number: "COM580", short_course: "Game Design", full_course: "Fundamentals of Game Design", meet_days: 5, semester_id: 1}
])
Source.create!([
  {short_source: "Challenges…", source_details: "\"Challenges for game designers\". Brathwaite, Brenda, and Ian Schreiber.", dummy: false, course_id: 2},
  {short_source: "Rules of Play", source_details: "\"Rules of Play\". Katie Salen Tekinbas and Eric Zimmerman.", dummy: false, course_id: 2},
  {short_source: "Learn to…", source_details: "\"Learn to Program (2nd ed.)\". Pine, C. ", dummy: false, course_id: 1},
  {short_source: "Agile Web Dev…", source_details: "\"Agile Web Development with Rails 4.\" Ruby, S., Thomas, D., and D. H. Hansson. ", dummy: false, course_id: 1},
  {short_source: "URL", source_details: "URL", dummy: true, course_id: 1},
  {short_source: "URL", source_details: "URL", dummy: true, course_id: 2}
])
Assignment.create!([
  {short_assignment: "JavaScript-p1", assignment_details: "Marijn Haverbeke, Eloquent JavaScript, Part 1", url: "http://eloquentjavascript.net/", due_date: "2015-03-24", completed: false, source_id: 5},
  {short_assignment: "Ch.22-24", assignment_details: "Chapters 22, 23, 24", url: "", due_date: "2015-03-04", completed: false, source_id: 2},
  {short_assignment: "Ch.10-11", assignment_details: "Chapter 10 and 11", url: "", due_date: "2015-03-02", completed: true, source_id: 1},
  {short_assignment: "Ch.11-12", assignment_details: "Chapter 11 and 12", url: "", due_date: "2015-03-31", completed: false, source_id: 4},
  {short_assignment: "Ch.24-25", assignment_details: "Chapter 24 and 25", url: "", due_date: "2015-03-31", completed: false, source_id: 4}
])
