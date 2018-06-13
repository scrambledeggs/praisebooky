class CreateMonthlyRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :monthly_rewards do |t|
      t.integer :point
      t.string :description

      t.timestamps
    end
  end
end
