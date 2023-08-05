class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.references :country, null: true, foreign_key: true
      t.references :topic, null: true, foreign_key: true
      t.references :article, null: true, foreign_key: true

      t.timestamps
    end
  end
end
