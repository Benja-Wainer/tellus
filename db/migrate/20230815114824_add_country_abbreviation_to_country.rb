class AddCountryAbbreviationToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :country_abbreviation, :string
  end
end
