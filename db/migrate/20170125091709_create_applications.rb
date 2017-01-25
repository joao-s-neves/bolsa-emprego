class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :applications, :follower_id
    add_index :applications, :followed_id
    add_index :applications, [:follower_id, :followed_id], unique: true
  end
end
