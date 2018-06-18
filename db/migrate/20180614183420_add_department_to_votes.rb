class AddDepartmentToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :department, foreign_key: true
  end
end
