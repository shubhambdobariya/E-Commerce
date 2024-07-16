# app/presenters/product_presenter.rb
class ProductPresenter
    def initialize(product)
      @product = product
    end
  
    def display_name
      "#{@product.title} (#{@product.category.name})"
    end
  
    def price
      "$#{'%.2f' % @product.price}"
    end
  
end
  