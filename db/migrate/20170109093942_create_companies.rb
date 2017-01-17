class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :nif
      t.references :professional_activity, foreign_key: true
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
