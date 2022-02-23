class CreateGoal < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :goal
      t.text :description

      t.timestamps
    end
  end
end
