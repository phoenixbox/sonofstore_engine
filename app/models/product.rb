class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :active

  validates_uniqueness_of :title
  validates_presence_of :title, :description, :price
  validates :price, :numericality =>  {:greater_than => 0}
  
  def active?
    if self.active == false
      "retired"
    else
      "active"
    end
  end
end
