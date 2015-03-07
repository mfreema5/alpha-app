class Semester < ActiveRecord::Base
  has_many :courses
  validates :short_title, :start_date, :end_date, presence: true
  # validates :short_title, uniqueness: true
end
