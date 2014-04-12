class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :problem_type
      t.boolean :solved, null: false, default: false
      t.integer :score, null: false, default: 0

      t.references :problem
      t.references :attendance

      t.timestamps
    end
  end
end
