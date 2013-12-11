class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :shops
  
  ROLES = %w[admin moderator member banned]
  MO_ROLES= %w[moderator member banned]
  
  validates :email, presence: true
  
  mount_uploader :avatar, AvatarUploader
  #accepts_nested_attributes_for :role
end
