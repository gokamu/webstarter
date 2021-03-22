class AddSlugToGrades < ActiveRecord::Migration[6.0]
  def change
    add_column :grades, :slug, :string
  end
end
