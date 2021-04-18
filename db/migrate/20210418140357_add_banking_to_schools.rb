class AddBankingToSchools < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :banking, :text
  end
end
