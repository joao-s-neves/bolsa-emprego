class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.datetime :d_nascimento
      t.string :cartao_cidadao
      t.string :area_profissional
      t.string :hab_literarias
      t.string :hab_ds
      t.string :situacao
      t.string :experiencia
      t.references :user, foreign_key: true

      t.timestamps
    end
    #add_index :candidates, [:user_id]
  end
end
