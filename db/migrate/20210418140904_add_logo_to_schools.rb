class AddLogoToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :logo, :string
  end
end
