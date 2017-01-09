class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :nome
      t.string :email
      t.string :morada
      t.string :cpostal
      t.string :localidade
      t.string :contacto
      t.string :pagina
      t.string :nif
      t.string :atividade_profissional
      t.string :apresentacao

      t.timestamps
    end
  end
end
