class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :status
      t.date :last_updated

      t.timestamps null: false
    end
  end
end
