class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.float :invest_amount, null: false
      t.references :users, index: true
      t.references :assets, index: true
      t.timestamps null: false
    end
  end
end
