class AddColumnXAndYToProblem < ActiveRecord::Migration
  def up
    change_table :problems do |t|
      t.integer :x
      t.integer :y
    end
  end
end
