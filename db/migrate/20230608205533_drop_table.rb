# frozen_string_literal: true

class DropTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :categories_deals
  end
end
