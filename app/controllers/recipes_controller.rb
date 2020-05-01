class RecipesController < ApplicationController
  #Recipe.joins(:ingredients).where('ingredients.name' => "chicken")
  
  #before_action :authorized
  def index
   @recipes = Recipe.all
    @recipes = Recipe.search(params[:search]) if params[:search].present?
           
  end
 
  def new
    @recipe = Recipe.new
    @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
  end

  def create
    
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end


  def edit
    @recipe = current_user.recipes.find_by_id(params[:id])
    @i = 3.times.collect { @recipe.recipe_ingredients.build }
  end

  def update
    @recipe = current_user.recipes.find_by_id(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "Your recipe has successfully been updated"
    else
      render :edit
    end
    end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def search
    
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name,:time_to_cook,:instructions, :search, :id, recipe_ingredients_attributes:[:id,:quantity, :ingredient_name])
  end

end