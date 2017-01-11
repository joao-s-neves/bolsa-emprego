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
      t.string :apresentacao
      t.string :tipo

      t.timestamps
    end
  end
end
