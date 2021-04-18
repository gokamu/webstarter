class AddContactToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :contact, :text
  end
end
