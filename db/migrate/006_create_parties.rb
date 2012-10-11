class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :user_id
      t.integer :scorecard_id

      t.timestamps
    end
  end
end
