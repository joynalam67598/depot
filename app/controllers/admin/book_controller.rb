class Admin::BookController < ApplicationController
end

# Imagine that our program has two such groups of controllers (say, admin/xxx
# and content/xxx) and that both groups define a book controller. There’d be a file
# called book_controller.rb in both the admin and content subdirectories of app/controllers.
#   Both of these controller files would define a class named BookController. If Rails
# took no further steps, these two classes would clash.
#   To deal with this, Rails assumes that controllers in subdirectories of the
# directory app/controllers are in Ruby modules named after the subdirectory. Thus,
# the book controller in the admin subdirectory would be declared like this:
#
# class Admin::BookController < ActionController::Base
# # ...
# end
#
# The book controller in the content subdirectory would be in the Content module:
#
# class Content::BookController < ActionController::Base
# # ...
# end