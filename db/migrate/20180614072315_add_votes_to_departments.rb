class AddVotesToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :votes, foreign_key: true
  end
end
