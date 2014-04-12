class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.boolean :is_admin, null: false, default: false

      t.references :group

      t.timestamps
    end
  end
end
