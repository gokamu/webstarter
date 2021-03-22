class AddSlugToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :slug, :string
  end
end
