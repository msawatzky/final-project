class Product < ApplicationRecord
  validates :name, :description, :price, :category_id, presence: true
  belongs_to :category
  has_many :order_products
  mount_uploader :image, ImageUploader

  def self.filter_by(category_id, search_text)
    products = Product.all
    # If category is chosen filter by category_id
    products = products.where(category_id: category_id) unless category_id.zero?
    # If text was entered filter the name by text
    products = products.where('name LIKE ?', "%#{search_text}%") unless search_text.empty?
    # Set pagination for products
    products.order(price: :desc).page(params[:page]).per(5)
  end
end
