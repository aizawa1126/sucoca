class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :course_id
      t.integer :number
      t.integer :par
      t.integer :hdcp
      t.integer :yard

      t.timestamps
    end
  end
end
