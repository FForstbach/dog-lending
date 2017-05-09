class FixColumnNameAvailibility < ActiveRecord::Migration[5.0]
  def change
    rename_column :dogs, :availibility, :availability
  end
end
