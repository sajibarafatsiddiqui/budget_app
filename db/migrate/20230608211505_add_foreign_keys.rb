# frozen_string_literal: true

class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :categories_deals, :categories
    add_foreign_key :categories_deals, :deals
  end
end
