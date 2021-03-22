class AddSlugToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :slug, :string
  end
end
