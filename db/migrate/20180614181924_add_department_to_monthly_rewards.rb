class AddDepartmentToMonthlyRewards < ActiveRecord::Migration[5.2]
  def change
    add_reference :monthly_rewards, :department, foreign_key: true
  end
end
