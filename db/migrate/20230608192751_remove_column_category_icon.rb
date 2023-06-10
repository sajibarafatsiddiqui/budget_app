# frozen_string_literal: true

class RemoveColumnCategoryIcon < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :Icon
  end
end
