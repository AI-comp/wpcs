class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.text :input_type
      t.text :output
    end
  end
end
