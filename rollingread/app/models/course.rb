class Course < ActiveRecord::Base
  belongs_to :semester
  has_many :sources
  has_many :assignments, through: :sources

  validates :short_title, :meet_days, presence: true
  # validates :short_title, uniqueness: true

end
