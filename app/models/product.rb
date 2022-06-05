class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :title, uniqueness:true
    validates_length_of :description, minimum: 5, maximum: 500, allow_blank: false
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\z}i,
        message: 'image must be in GIF, JPG or PNG format.'
    }
end
