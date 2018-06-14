class AddMonthlyRewardsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :monthly_rewards, foreign_key: true
  end
end
