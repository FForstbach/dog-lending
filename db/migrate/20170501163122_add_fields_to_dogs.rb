class AddFieldsToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :location, :text
    add_column :dogs, :breed, :text
  end
end
