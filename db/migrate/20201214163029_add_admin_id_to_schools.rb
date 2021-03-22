class AddAdminIdToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :admin_id, :integer
  end
end
