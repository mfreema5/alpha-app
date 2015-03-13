class Course < ActiveRecord::Base
  belongs_to :semester, inverse_of: :courses
  has_many :sources
  has_many :assignments, through: :sources

  validates :course_number, :meet_days, :semester_id, presence: true
  validates :course_number, format: { with: /\A\D\D\D\d\d\d\Z/, message: "course number should be “three [A-Z] + three [0-9]”" }


#t.string   "course_number"
#t.string   "short_course"
#t.text     "full_course"
#t.integer  "meet_days"
#t.integer  "semester_id"
end
