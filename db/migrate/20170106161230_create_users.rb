class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :morada
      t.string :cpostal
      t.string :localidade
      t.string :contacto
      t.string :pagina
      t.datetime :d_nascimento
      t.string :cartao_cidadao
      t.string :area_profissional
      t.string :apresentacao
      t.string :hab_literarias
      t.string :hab_ds
      t.string :situacao
      t.string :experiencia

      t.timestamps
    end
  end
end
