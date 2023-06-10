# frozen_string_literal: true

class RenameGroupsToCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :groups, :categories
  end
end
