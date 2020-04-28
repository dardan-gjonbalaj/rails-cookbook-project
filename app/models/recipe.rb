class Recipe < ActiveRecord::Base 
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :name, uniqueness: true
  accepts_nested_attributes_for :ingredients
  #accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank

  scope :similar, -> (ingredient) {Recipe.joins(:ingredients).where("ingredients.name = ?", ingredient)}

  def self.search(search)
    if search
      recipe = Recipe.similar(search)
      if recipe
        return recipe
      else
        Recipe.all
      end
    else
      Recipe.all
    end
  end

#add or remove ingredients from edit? .destroy or destroy_all
# def recipe_ingredients_attributes=(recipe_attributes) -> array of hashes find_by_ingredient_id
# self.recipe_ingredients=
# ingredient = Ingredient.
#

end