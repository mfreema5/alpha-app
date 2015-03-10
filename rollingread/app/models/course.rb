class Course < ActiveRecord::Base
  belongs_to :semester, inverse_of: :courses
  has_many :sources
  has_many :assignments, through: :sources

  # validates :short_course, :meet_days, presence: true

end
