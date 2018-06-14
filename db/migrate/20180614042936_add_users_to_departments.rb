class AddUsersToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :users, foreign_key: true
  end
end
