class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :contact
      t.string :page
      t.string :presentation
      t.integer :user_type
      t.references :candidate, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
