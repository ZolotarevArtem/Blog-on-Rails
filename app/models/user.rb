class User < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :password, length: { minimum: 6 }, confirmation: true
#  validates :password_confirmation, presence: true
  validates :email, 
  	presence: true,
    uniqueness: true,
    format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

	has_many :post
  has_many :comment

  def auth(pass)
    self.password == hash(pass)
  end

  def save
  	self.password = hash(self.password)
  	super
  end
  
  private

  def hash(pass)
    Digest::MD5.hexdigest(pass)
  end
end
