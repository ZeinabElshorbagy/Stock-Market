class AddDefualtValueToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_type, :string, default: 'user'
  end
end
