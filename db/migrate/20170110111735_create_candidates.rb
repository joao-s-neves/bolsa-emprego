class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.datetime :birth_date
      t.string :document
      t.string :habilitation_description
      t.string :experience

      t.references :professional_area, foreign_key: true
      t.references :habilitations, foreign_key: true
      t.references :professional_situation, foreign_key: true
      #t.references :user #, foreign_key: true

      t.timestamps
    end
  end
end
