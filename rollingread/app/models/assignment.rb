class Assignment < ActiveRecord::Base
  belongs_to :source, inverse_of: :assignments
  
end
