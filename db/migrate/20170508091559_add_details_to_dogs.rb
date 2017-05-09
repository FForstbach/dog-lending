class AddDetailsToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :favorite_snack, :text
    add_column :dogs, :favorite_toy, :text
  end
end
