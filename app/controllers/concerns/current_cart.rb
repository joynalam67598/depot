module CurrentCart
    private #prevents Rails from ever making it available as an action on the controller
        def set_cart
           @cart = Cart.find(session[:cart_id])
#         cart record isn’t found, this method will proceed to create a new Cart and then store the ID of the created
# cart into the session.
        rescue ActiveRecord::RecordNotFound
            @cart = Cart.new
            session[:cart_id] = @cart.id
        end
end