class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes
  has_many :ingredients, through: :recipes
  validates :name, presence: true, uniqueness: true
  
  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by(name: hash[:info][:email]) { |u|
      pw = SecureRandom.hex(64)
      #self.password = pw
      binding.pry
  }
  end

end