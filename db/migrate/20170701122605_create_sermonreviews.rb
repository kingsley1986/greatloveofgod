class CreateSermonreviews < ActiveRecord::Migration
  def change
    create_table :sermonreviews do |t|
      t.text :body
      t.string :name
      t.string :email
      t.references :sermon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
