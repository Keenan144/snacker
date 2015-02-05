class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :handle
      t.string  :name
      t.string  :password_hash
      t.string  :profile_picture

      t.timestamps
    end
  end
end
