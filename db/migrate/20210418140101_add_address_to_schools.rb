class AddAddressToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :address, :text
  end
end
