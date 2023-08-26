class AddCodeToCountry < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :code, :string
  end
end
