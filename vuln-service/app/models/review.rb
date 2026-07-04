# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :rating, numericality: { only_integer: true }
  validates :rating, :comment, presence: true
end
