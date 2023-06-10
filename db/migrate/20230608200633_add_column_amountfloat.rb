# frozen_string_literal: true

class AddColumnAmountfloat < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :amount, :float
  end
end
