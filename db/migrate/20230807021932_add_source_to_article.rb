class AddSourceToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :source, :string
  end
end
