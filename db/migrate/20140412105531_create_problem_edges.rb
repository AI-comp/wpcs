class CreateProblemEdges < ActiveRecord::Migration
  def change
    create_table :problem_edges do |t|
      t.integer :from_problem_id, null: false
      t.integer :to_problem_id, null: false

      t.timestamps
    end
  end
end
