# frozen_string_literal: true

class AddAuthorToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :deals, :user, null: false, foreign_key: true
    rename_column :deals, :user_id, :author_id
  end
end
