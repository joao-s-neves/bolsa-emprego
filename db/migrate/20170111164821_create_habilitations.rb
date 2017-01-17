class CreateHabilitations < ActiveRecord::Migration[5.0]
  def change
    create_table :habilitations do |t|
      t.string :name

      t.timestamps
    end
  end
end
