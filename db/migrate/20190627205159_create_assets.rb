class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end
