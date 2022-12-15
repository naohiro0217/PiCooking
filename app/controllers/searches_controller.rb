class SearchesController < ApplicationController
  # before_action :authenticate_customer!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == 'customer'
      @records = Customer.search_for(@content, @method)
    elsif @model == 'cook'
      @records = Cook.search_for(@content, @method)
    elsif @model == 'cook'
      @records = Cook.search_cooks_for(@content, @method)
    end
  end
end
