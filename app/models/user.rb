
class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of  :email, :case_sensitive => false
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :venues

end
