class AddPortalIdCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :portal_id, :integer
  end
end
