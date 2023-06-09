class EntitiesToDeals < ActiveRecord::Migration[7.0]
  def change
    rename_table :entities, :deals
  end
end
