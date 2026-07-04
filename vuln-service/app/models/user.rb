# frozen_string_literal: true

class User < ApplicationRecord
  has_many :books
  has_many :reviews
  validates :name, :password, :email, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :password, length: { minimum: 6 }
end
