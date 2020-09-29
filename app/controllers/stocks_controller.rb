class StocksController < ApplicationController

  def search
    @stock = Stock.new_from_lookup(params[:stock])
     # render json: @stock

    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    # render partial: 'users/result'
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end