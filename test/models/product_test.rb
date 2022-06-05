require "test_helper"

class ProductTest < ActiveSupport::TestCase
  

#   We can use the model’s errors() and invalid?() methods to see if it validates,
# and we can use the any?() method of the error list to see
# if an error is associated with a particular attribute.
# We can use the model’s errors() and invalid?() methods
# to see if it validates, and we can use the any?() method of the error list to see
# if an error is associated with a particular attribute.
#   assert() method, which expects its argument to be
# true. If it is, nothing special happens.

# we expect that an empty Product model won’t pass validation,
  #  test "product attribute must not be empty" do
  #    product = Product.new
  #    assert product.invalid?
  #    assert product.errors[:title].any?()
  #    assert product.errors[:description].any?()
  #    assert product.errors[:price].any?()
  #    assert product.errors[:image_url].any?()
  #  end

# check that the validation of the price
  # test "product price must be positive" do
  #   product = Product.new(title:"My Book Title",
  #                         description: "yyy",
  #                         image_url: "zzz.jpg"
  #                       )
  #   product.price = -1
  #   assert product.invalid?
  #   assert_equal ["must be greater than or equal to 0.01"],
  #   product.errors[:price]
  #   product.price = 0
  #   assert product.invalid?
  #   assert_equal ["must be greater than or equal to 0.01"],
  #   product.errors[:price]
  #   product.price = 1
  #   assert product.valid?
  # end


  # validating that the image URL ends with one of .gif, .jpg, or .png
  # def new_product(image_url)
  #   Product.new(title:"My Book Title",
  #               description: "yyy",
  #               price: 1,
  #               image_url: image_url
  #             )
  # end

  # test "image url" do
  #   ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
  #   bad = %w{ fred.doc fred.gif/more fred.gif.more }
  #   ok.each do |image_url|
  #     assert new_product(image_url).valid?,"#{image_url} shouldn't be invalid"
  #       # added an extra parameter to our assert This will be written along with the error message if the assertion
  #       # fails and can be useful for diagnosing what went wrong.
  #   end

  #   bad.each do |image_url|
  #     assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
  #   end
  # end



  #testing useing Fexture-------------------------------

  # to load ylm data

  fixtures :products 
  # test "product is not valid without a unique title" do
  #   product = Product.new(title:products(:ruby).title,
  #                         description: "yyy",
  #                         price: 1,
  #                         image_url:"fred.gif")
  #   assert product.invalid?
  #   assert_equal ["has already been taken"], product.errors[:title]
  # end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:products(:ruby).title,
                          description: "yyy",
                          price:1,
                          image_url:"fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],product.errors[:title]
  end




end
