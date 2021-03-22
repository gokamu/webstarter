class AddSlugToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :slug, :string
  end
end
