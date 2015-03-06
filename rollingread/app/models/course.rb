class Course < ActiveRecord::Base
  belongs_to :semester
  has_many :sources

  before_create :get_semester_choices
  before_update :get_semester_choices

  validates :short_title, :meet_days, :semester, presence: true
  validates :short_title, uniqueness: true

  include UseDates  # This module gives us the "most_proximate()" method

  private

    # "Semesters" is a small table - we'll just pass the whole thing
    # If it were bigger, maybe have a selection by ":user" or summat?

    def get_semester_choices
      @semester_choices = Semester.order(':start_date')
      @semester_choices_default = most_proximate( @semester_choices, ':end_date' )
    end

end
