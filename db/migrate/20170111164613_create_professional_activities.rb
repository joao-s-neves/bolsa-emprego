class CreateProfessionalActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :professional_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end
