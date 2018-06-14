class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :point
      t.string :comment

      t.timestamps
    end
  end
end
