class Removedealidfromcategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :deal_id
  end
end
