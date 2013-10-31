class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text   :description
      t.text   :description_html
      t.text   :small_input
      t.text   :small_output
      t.text   :large_input
      t.text   :large_output
      t.integer :small_score, null: false, default: 0
      t.integer :large_score, null: false, default: 0
      t.boolean :is_solved, null: false, default: false

      t.references :contest

      t.timestamps
    end
  end
end
