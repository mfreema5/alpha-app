class Semester < ActiveRecord::Base
  has_many :courses

  validates :short_semester, :start_date, :end_date, presence: true


#t.string   "short_semester"
#t.text     "full_semester"
#t.date     "start_date"
#t.date     "end_date"
end
