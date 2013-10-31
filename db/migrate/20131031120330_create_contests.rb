class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.text   :introduction
      t.time   :start_time
      t.time   :end_time
      t.timestamps
    end
  end
end
