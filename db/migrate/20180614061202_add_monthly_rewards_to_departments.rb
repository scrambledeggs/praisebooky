class AddMonthlyRewardsToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :monthly_rewards, foreign_key: true
  end
end
