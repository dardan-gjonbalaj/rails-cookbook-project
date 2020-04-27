class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :time_to_cook, null: false
      t.text :instructions, null: false
      t.belongs_to :user, null: false
      t.timestamps null: false
    end
  end
end
