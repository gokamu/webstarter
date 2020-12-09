class AddSchoolIdToPortals < ActiveRecord::Migration[6.0]
  def change
    add_column :portals, :school_id, :integer
  end
end
