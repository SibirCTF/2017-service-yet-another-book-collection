# frozen_string_literal: true

class AddAttachmentBookCoverToBooks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :books do |t|
      t.attachment :book_cover
    end
  end

  def self.down
    remove_attachment :books, :book_cover
  end
end
