class AddDepartmentToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :department, foreign_key: true
  end
end
