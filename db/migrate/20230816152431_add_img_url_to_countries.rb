class AddImgUrlToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :img_url, :string
  end
end
