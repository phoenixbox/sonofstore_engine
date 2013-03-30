class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price_in_dollars, :active, :category_ids

  validates_uniqueness_of :title
  validates_presence_of :title, :description, :price, :price_in_dollars
  validates :price, :numericality => {:greater_than => 001, :message => "price must be greater than zero"}
  has_many :product_categories
  has_many :categories, through: :product_categories

  def active?
    if self.active == false
      "retired"
    else
      "active"
    end
  end

  def price_in_dollars
    price.to_d / 100 if price
  end

  def price_in_dollars=(dollars)
    self.price = dollars.to_d * 100.0
  end

  def categories_list
    self.categories.join(", ")
  end
end
