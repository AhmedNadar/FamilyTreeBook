class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # associations
  has_many :statuses
  
  
  # Validations
  validates_presence_of :first_name, :last_name, :profile_name
	validates_uniqueness_of :profile_name
  validates_format_of :profile_name, with: /\A[a-zA-Z0-9_-]+\$Z/, message: "Must be formatted correctly."


  def full_name
  	"#{first_name.capitalize} #{last_name.capitalize}"
  end
end
