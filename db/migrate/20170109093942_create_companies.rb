class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :nif
      t.string :atividade_profissional
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
