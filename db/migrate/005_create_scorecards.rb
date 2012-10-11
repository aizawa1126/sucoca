class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :course_id
      t.date :date

      t.timestamps
    end
  end
end
