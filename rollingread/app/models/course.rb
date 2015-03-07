class Course < ActiveRecord::Base
  belongs_to :semester
  has_many :sources

  before_create :get_semester_choices
  before_update :get_semester_choices

  validates :short_title, :meet_days, presence: true
  validates :short_title, uniqueness: true

end
