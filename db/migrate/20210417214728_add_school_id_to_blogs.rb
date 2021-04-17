class AddSchoolIdToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :school_id, :integer
  end
end
