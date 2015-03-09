class Assignment < ActiveRecord::Base
  belongs_to :source

  validates :source, presence: true
end
