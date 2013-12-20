class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #attr_accessor :state
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :shops
  has_many :news
  ROLES = %w[admin moderator member banned]
  MO_ROLES= %w[moderator member banned]
  
  validates :email, presence: true  
  mount_uploader :avatar, AvatarUploader
  #accepts_nested_attributes_for :role
  
  scope :findemail, ->(email) { where("email LIKE ?", email) unless email.nil? }
  
  state_machine :state, initial: :awaiting_selection do
    event :button_press do
      transition all => :dispense_soda
    end
    
    event :soda_dropped do
      transition :dispense_soda => :complete
    end
    
    state :awaiting_selection
    state :dispense_soda
    state :complete
    
  end
  
  
  
end
