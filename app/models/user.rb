class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :pseudo, :avatar

  has_attached_file :avatar, :styles => { :medium => "145x145>", :thumb => "100x100>" }, :default_url => "default_:style_avatar.png"

  validates_presence_of :pseudo

  has_many :travels, :dependent => :destroy

end
