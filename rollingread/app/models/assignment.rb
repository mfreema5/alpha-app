class Assignment < ActiveRecord::Base
  belongs_to :source, inverse_of: :assignments

  validates :short_assignment, :due_date, :source_id, presence: true
  validates :url, format: { with: /\Ahttp:\/\//, message: "invalid URL format" }


# Annoyance:  
#   In `irb`, this fails: %r{#{/\AMy:U/}}
#   and this works:       %r{#{'/\AMy:U/'}}
#   In rails, this fails: %r{#{'/\AMy:U/'}}
#   and this works:       %r{#{/\AMy:U/}}
# Why does rails evaluate ruby differently than irb does?
#
# So, the validation for ':url' is rather simplistic, because I can't 
# troubleshoot the regexp in 'irb', since things that work in 'irb'
# fail in rails, and vice-versa. And trying to troubleshoot regex 
# anomalies in rails is a nightmare, IMO.
#
# I can't even get the gorram thing to test for a "dot". Everything says
# you can backslash escape a period to get a literal, but that does not 
# work here. So, since I ain't a code-monkey, and I don't want to be,
# screw it. The simplistic validation proves the concept well enough.

#t.string   "short_assignment"
#t.text     "assignment_details"
#t.string   "url"
#t.date     "due_date"
#t.boolean  "completed"
#t.integer  "source_id"
end
