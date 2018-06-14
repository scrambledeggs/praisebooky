class AddVotesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :votes, foreign_key: true
  end
end
