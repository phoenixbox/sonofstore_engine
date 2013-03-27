class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :active

  validates_uniqueness_of :title
  validates_presence_of :title, :description, :price

  def active?
    if self.active == false
      "retired"
    else
      "active"
    end
  end
end
