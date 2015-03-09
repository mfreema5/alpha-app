class Source < ActiveRecord::Base
  belongs_to :course
  has_many :assignments
  validates :short_title, :course, presence: true
  # validates :short_title, uniqueness: true, unless: :is_dummy?

  # def is_dummy?
  #   :short_title == "URL" || :short_title == "Article"
  # end
end
