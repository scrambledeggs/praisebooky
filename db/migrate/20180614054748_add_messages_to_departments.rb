class AddMessagesToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :messages, foreign_key: true
  end
end
