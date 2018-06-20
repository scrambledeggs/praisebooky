class AddColumnNameToVote < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :receiver_id, :integer
  end
end
