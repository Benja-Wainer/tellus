class AddAltToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :alt, :string
  end
end
