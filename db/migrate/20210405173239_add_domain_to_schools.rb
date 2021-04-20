class AddDomainToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :domain, :string
  end
end
