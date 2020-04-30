class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  #validates :ingredient_id , uniqueness: true

  validates_uniqueness_of :ingredient_id, scope: :recipe_id
  def ingredient_name
    ingredient.try(:name)
  end

  def ingredient_name=(name)
    puts name
    self.ingredient = Ingredient.find_or_create_by(name: name.downcase) #unless name.blank?
    
  end
end
