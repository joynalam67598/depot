class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :title, uniqueness:true
    validates_length_of :description, minimum: 5, maximum: 500, allow_blank: false
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\z}i,
        message: 'image must be in GIF, JPG or PNG format.'
    }

    has_many :line_items

    before_destroy :ensure_not_referenced_by_any_line_item

# ensure that there are no line items referencing this product
#hook method -> called before Rails attempts to destroy a row
    private 
        def ensure_not_referenced_by_any_line_item 
            unless line_items.empty?
                errors.add(:base,'Line item present')
                throw :abort
            end
        end
end
