class Product < ApplicationRecord
  validates :name, :description, :price, :category_id, presence: true
  belongs_to :category
  mount_uploader :image, ImageUploader
end
