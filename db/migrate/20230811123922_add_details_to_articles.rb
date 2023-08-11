class AddDetailsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :image_url, :string
    add_column :articles, :date, :string
  end
end
