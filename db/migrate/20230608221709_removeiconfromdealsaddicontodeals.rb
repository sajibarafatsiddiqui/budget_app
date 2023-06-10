# frozen_string_literal: true

class Removeiconfromdealsaddicontodeals < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :icon, :string
    remove_column :deals, :icon
  end
end
