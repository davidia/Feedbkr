class Venue

  include Mongoid::Document

  field  :name
  belongs_to :user
  has_many :feedback

  validates :name, uniqueness: true, length: { :within => 2..60 }

end