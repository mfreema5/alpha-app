class Source < ActiveRecord::Base
  belongs_to :course, inverse_of: :sources
  has_many :assignments

  validates :short_source, :course_id, presence: true

end
