class AddIsAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isAdmin, :boolean, default: false
  end
end
