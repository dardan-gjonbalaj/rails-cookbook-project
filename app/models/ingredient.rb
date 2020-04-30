class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true
  validates :name, uniqueness: true

  # def ingredient_name
  #   ingredient.try(:name)
  # end

  #  def ingredient_name=(name)
  #    #binding.pry
  #    self.name = Ingredient.find_or_create_by(name: name.downcase) unless name.blank?
  #  end
end