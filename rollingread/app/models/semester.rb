class Semester < ActiveRecord::Base
  has_many :courses
  has_many :sources, through: :courses
  has_many :assignments, through: :sources
  validates :short_title, :start_date, :end_date, presence: true
  # validates :short_title, uniqueness: true
end
