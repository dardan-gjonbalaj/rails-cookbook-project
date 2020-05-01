class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes
  has_many :ingredients, through: :recipes
  validates :name, presence: true, uniqueness: true

end