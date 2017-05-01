class AddUserReferenceToDogs < ActiveRecord::Migration[5.0]
  def change
    add_reference :dogs, :user, foreign_key: true
  end
end
