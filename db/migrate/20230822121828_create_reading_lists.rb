class CreateReadingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :reading_lists do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
