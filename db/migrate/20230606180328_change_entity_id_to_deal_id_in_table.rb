class ChangeEntityIdToDealIdInTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :entity_id, :deal_id

  end
end
