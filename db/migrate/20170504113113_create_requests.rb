class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :dog, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
