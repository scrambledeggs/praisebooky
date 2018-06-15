class AddUserToMonthlyReward < ActiveRecord::Migration[5.2]
  def change
    add_reference :monthly_rewards, :user, foreign_key: true
  end
end
