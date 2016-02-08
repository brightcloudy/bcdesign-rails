class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :category, :index => true
      t.belongs_to :project, :index => true

      t.timestamps null: false
    end
  end
end
