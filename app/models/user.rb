class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  # validates :name, presence: true, length: { maximum: 50 }, :on => :update #these are simply methods
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[yale]+\.[edu]+\z/i
  # validates :email, presence: true, 
  #           format: { with: VALID_EMAIL_REGEX }, 
  #           uniqueness: { case_sensitive: false }, :on => :update
  # has_secure_password
  # validates :password, length: { minimum: 6 }
 
  # Associations
  has_many :roles
  has_many :projects, through: :roles
  has_one :interest, inverse_of: :user
  has_many :auditions
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :interest
 
 
    
  # Accessors 
  
  
 

 
  
end