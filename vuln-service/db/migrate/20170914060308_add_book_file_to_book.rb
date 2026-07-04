# frozen_string_literal: true

class AddBookFileToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :book_file, :binary
  end
end
