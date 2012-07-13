class LineItem < ActiveRecord::Base
  attr_accessible :title, :body, :product, :product_id, :quantity
  before_save :update_cart
  
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  
  def total_price
    product.price * quantity
  end
  
  def update_cart
    if self.cart
      self.cart.update_attribute(:updated_at, Time.now)
    end
  end
  
end
