class Feedback
	include Mongoid::Document
  
  field :text
  field :source
  field :timestamp, type: DateTime
  
  validates :text, length: { :within => 5..600 }
  validates :source, length: { :within => 4..60 }

  belongs_to :venue 

end