class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :active

  validates_uniqueness_of :title
  validates_presence_of :title, :description, :price
  validates :price, :numericality =>  {:greater_than => 0}
  #validates :price, :format => {:with => /\d{0,10000}\.\d{2}/, :message => ": please save in this format: 10.00"}

  def active?
    if self.active == false
      "retired"
    else
      "active"
    end
  end
end
