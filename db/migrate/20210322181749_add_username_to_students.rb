class AddUsernameToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :username, :string
  end
end
