class AddMessagesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :messages, foreign_key: true
  end
end
