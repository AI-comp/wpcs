class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user, null: false
      t.references :contest, null: false
      t.timestamps
    end
  end
end
