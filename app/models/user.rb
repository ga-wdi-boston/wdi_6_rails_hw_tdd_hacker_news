class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments
  has_many :votes

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
