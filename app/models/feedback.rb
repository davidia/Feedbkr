class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :text
  field :source  
  
  validates :text, length: { :within => 5..600 }
  validates :source, length: { :within => 4..60 }

  belongs_to :venue 

end