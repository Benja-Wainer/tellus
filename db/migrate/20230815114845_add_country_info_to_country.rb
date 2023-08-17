class AddCountryInfoToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :country_info, :string
  end
end
