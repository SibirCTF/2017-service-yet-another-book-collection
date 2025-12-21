# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc
      t.string :author

      t.timestamps
    end
  end
end
