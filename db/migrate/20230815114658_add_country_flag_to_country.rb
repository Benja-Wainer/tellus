class AddCountryFlagToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :country_flag, :string
  end
end
