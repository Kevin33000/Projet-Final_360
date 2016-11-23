class CreatePois < ActiveRecord::Migration[5.0]
  def change
    create_table :pois do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.text :caption

      t.timestamps
    end
  end
end
