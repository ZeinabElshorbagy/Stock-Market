class CreateInvests < ActiveRecord::Migration[5.2]
  def change
    create_table :invests do |t|
      t.float :invest_amount, null: false
      t.references :user, index: true
      t.references :asset, index: true
      t.references :portfolio, index: true
      t.timestamps null: false
    end
  end
end
