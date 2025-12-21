# frozen_string_literal: true

class AddIsPrivateToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :is_privat, :boolean
  end
end
