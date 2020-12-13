class AddLevelIdToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :level_id, :integer
  end
end
