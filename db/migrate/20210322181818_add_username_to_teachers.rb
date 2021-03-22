class AddUsernameToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :username, :string
  end
end
