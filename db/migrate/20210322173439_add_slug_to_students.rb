class AddSlugToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :slug, :string
  end
end
