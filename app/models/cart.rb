class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products

  def add_product(product_id)
    puts 'in product method'
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      puts "found item"
      current_item.quantity += 1
    else
      puts "create new item"
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end