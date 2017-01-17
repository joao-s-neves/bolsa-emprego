class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.datetime :begins
      t.datetime :ends
      t.string :contract_type
      t.string :salary
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
