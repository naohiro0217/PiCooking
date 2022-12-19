class SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == 'customer'
      @records = Customer.search_for(@content, @method)
    elsif @model == 'cook'
      @records = Cook.search_for(@content, @method)
    elsif @model == 'tag'
      @records = Cook.search_by_name(@content, @method)
    elsif @model == 'rate'
      @records = Cook.search_by_rate(@content)
    end
  end
end
