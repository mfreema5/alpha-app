# &lsquo;Rolling Read&rsquo; web app

&lsquo;Rolling Read&rsquo; is short for &ldquo;Rolling Reading List&rdquo;.  The primary view in this app is a webpage that shows when reading assignments are due, and also lets the user check-off assignments then they are completed.

The user enters information about courses and source materials, such as textbooks, and when sections of those sources are assigned to be read.

Sketch of default view:

![Default view](img/rollingread-default-view.png)
 
## Tables

###Sketch of tables and fields

![Tables sketch](img/rollingread-tables-02Mar15.png)


### Scaffolds

(obsolete; need to update to match new tables)

* `rails generate scaffold Semester short_title:string description:text start_date:date end_date:date`

* `rails generate scaffold Course course_number:string short_title:string description:text meet_day1:boolean meet_day2:boolean meet_day3:boolean meet_day4:boolean meet_day5:boolean meet_day6:boolean meet_day7:boolean semester_id:integer`

* `rails generate scaffold Source short_title:string biblio_info:text url:string course_id:integer`

* `rails generate scaffold Section chapter_number:string details:text read_by:date completed:boolean source_id:integer`

----

### Validations & Fixtures

#### Semesters

| name        | type   | required? | validate         | fixture 1 | fixture 2 |
|-------------|--------|-----------|------------------|-----------|-----------|
| short_title | string |     Y     | uniqueness       | S15       | F15       |
| description | text   |           |                  |Spring 2015| Fall 2015 |
| start_date  | date   |     Y     |                  | 12Jan15   | 19Aug15   |
| end_date    | date   |     Y     | after start_date | 02May15   | 05Dec15   |
| id          |integer | implicit  | n/a              | 1         | 2         |

####Courses 

| name          | type    | required? | validate   | fixture 1 | fixture 2 |
|---------------|---------|-----------|------------|-----------|-----------|
| course_number | string  |           |            | COM531    |  COM580   |
| short_title   | string  |     Y     | uniqueness | Web Apps  | Know-Mgt  |
| description   | text    |           |            | … … … … … | … … … … … |
| meet_days     | integer |     Y     |            |  2        | 32        |
| semester_id   | integer |     Y     | must exist |  1        |  2        |
| id            | integer | implicit  | n/a        | 11        | 12        |


####Sources

| name        | type    | required? | validate               | fixture 1 | fixture 2 |
|-------------|---------|-----------|------------------------|-----------|-----------|
| short_title | string  |     Y     | uniqueness (if !dummy) | AgileDev  | URL       |
| description | text    |           |                        | Ruby, S., Thomas, D., and D. H. Hansson. Agile Web Development with Rails 4. |  |
| dummy       | boolean | | short_title in ("URL","Article") | false     | true      |
| course_id   | integer |     Y     | must exist             | 11        | 12        |
| id          | integer | implicit  | n/a                    | 21        | 22        |


#### Assignments

| name           | type    | required? | validate         | fixture 1 | fixture 2    |
|----------------|---------|-----------|------------------|-----------|--------------|
| short_title    | string  |     Y     |                  | Chpt14    | Vid-Long_web |
| details        | text    |           |                  |Chapter 14 | Jeremy Keith, "The Long Web" |
| url            | string  |           | well-formed      |           | http://aneventapart.com/news/post/the-long-web-by-jeremy-keith-an-event-apart-video |
| due_date       | date    | Y | before Semester.end_date | 07Apr15   | 08Sep15      |
| completed      | boolean |           |                  | false     | false        |
| source_id      | integer |     Y     | must exist       | 21        | 22           |
| id             | integer | implicit  | n/a              | 31        | 32           |

----

### Days to bits

Store the days that a class meets as an integer between 1 and 127, by assigning a day to each bit of the integer in binary.

| Sun | Sat | Fri | Thu | Wed | Tue | Mon | &#8721; |
|-----|-----|-----|-----|-----|-----|-----|---------|
|  64 |  32 |  16 |   8 |   4 |   2 |   1 |     127 |
|   0 |   0 |   1 |   0 |   1 |   0 |   1 |      21 |
|   0 |   0 |   0 |   1 |   0 |   1 |   0 |      10 |

A class that meets Monday, Wednesday, Friday, would have an integer of 21.
A class that meets Tuesday, Thursday, would have an integer of 10.





