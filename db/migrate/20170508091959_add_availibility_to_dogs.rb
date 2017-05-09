class AddAvailibilityToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :active, :boolean
    add_column :dogs, :availibility, :string
  end
end
