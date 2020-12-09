class CreatePortals < ActiveRecord::Migration[6.0]
  def change
    create_table :portals do |t|
      t.string :name
      t.timestamps
    end
  end
end
