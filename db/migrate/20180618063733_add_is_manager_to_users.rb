class AddIsManagerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isManager, :boolean, default: false
  end
end
