class CustomersController < ApplicationController
  PAGE_SIZE = 10
  def index
    @page = (params[:page] || 0).to_i
  	if params[:keywords].present?
  		@keywords = params[:keywords]
  		customer_search_term = CustomerSearchTerm.new(@keywords)
  		@customers = Customer.where(
  			customer_search_term.where_clause,
  			customer_search_term.where_args).
  			order(customer_search_term.order).
        offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
  	else
  		@customers = []
  	end
    respond_to do|format|
      format.html {}
      format.json { render json: @customers}
    end
  end
end
# ctrl + alt + enter -> activate emmet
# C-g -> remove mark C-SPC -> add mark C-x s -> save file
# M-w -> copy text C-y -> paste text C-w -> cut text
# C-x 2 -> split current window in two C-x 3 -> split current window in three
# C-x 0 -> delete current window
# C-x 1 -> delete all other windows
# C-x o -> switch window
# C-x k -> kill buffer