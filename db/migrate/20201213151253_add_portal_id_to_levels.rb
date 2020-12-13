class AddPortalIdToLevels < ActiveRecord::Migration[6.0]
  def change
    add_column :levels, :portal_id, :integer
  end
end
