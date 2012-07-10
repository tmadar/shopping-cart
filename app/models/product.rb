class Product < ActiveRecord::Base
    validates :title, uniqueness: true
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :image_url, allow_blank: true, format:
    {
    with:       %r{\.(gif|png|jpg)$}i,
    message:    'must be a URL for GIF, JPG, or PNG image'
    }
  attr_accessible :description, :image_url, :price, :title
end
