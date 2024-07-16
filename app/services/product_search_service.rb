class ProductSearchService
    def initialize(params)
      @params = params
    end
  
    def call
      products = Product.all
  
      if @params[:search].present?
        search_term = @params[:search].downcase
        products = products.where('LOWER(title) LIKE ? OR LOWER(description) LIKE ? OR LOWER(price::text) LIKE ? OR LOWER(compare_at_price::text) LIKE ?', 
                                  "%#{search_term}%", 
                                  "%#{search_term}%", 
                                  "%#{search_term}%", 
                                  "%#{search_term}%")
      end
  
      products.paginate(page: @params[:page], per_page: 10)
    end
  end
  