class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :date
      t.string :summary
      t.string :text
      t.string :picture
      t.boolean :active
      t.boolean :featured

      t.timestamps
    end
  end
end
