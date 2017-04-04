class Page < ApplicationRecord
  validates :code, uniqueness: true
  validates :code, :title, :description, presence: true
end
