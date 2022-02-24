class StocksController < ApplicationController

  def search
    if params[:stock].present?
      search_stock(params[:stock])
    else
      flash[:alert] = 'Please insert a symbol to search'
      redirect_to my_portfolio_path
    end
  end

  private

  def search_stock(symbol)
    @stock = Stock.new_lookup(params[:stock])
    if @stock
      respond_to do |format|
        format.js { render partial: 'users/result' }
      end
    else
      flash[:alert] = 'Invalid symbol! Try another one?'
      redirect_to my_portfolio_path
    end
  end

end