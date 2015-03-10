class Semester < ActiveRecord::Base
  has_many :courses

  # validates :short_semester, :start_date, :end_date, presence: true

end
