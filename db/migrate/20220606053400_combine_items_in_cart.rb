class CombineItemsInCart < ActiveRecord::Migration[6.1]
  def change
  end
  def up 
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      sums = cart.line_item.group(:product_id).sum(:quantity)
      sums.each do |prodcut_id,quantity|
        if quantity>1
          cart.line_items.where(product_id:product_id).delete_all
          
          item = cart.line_items.build(product_id:product_id)
          item.quantity = sums
          item.save
        end
      end
    end
  end
  

#   #This method finds line items with a quantity of
# greater than one; adds new line items for this cart and product, each with a
# quantity of one; and, finally, deletes the line item:
  def down 
    LineItem.where(quantity>1).each do |line_item|
      line_item.quantity.times do 
        LineItem.create(
          cart_id: line_item.cart_id,
          prodcut_id:line_item.product_id,
          quantity:1
        )
      end
      line_item.destroy
    end
  end


end
