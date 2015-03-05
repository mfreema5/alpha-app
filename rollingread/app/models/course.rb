class Course < ActiveRecord::Base
  belongs_to :semester
  has_many :sources
  validates :short_title, :meet_days, :semester, presence: true
  validates :short_title, uniqueness: true
end
