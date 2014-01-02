class User < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email 
  	presence: true,
    uniqueness: true,
    format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

	has_many :post
  has_many :comment
end
