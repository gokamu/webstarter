class AddCustomDomainToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :custom_domain, :string
  end
end
