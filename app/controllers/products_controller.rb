class ProductsController < ApplicationController
  def index
    render json: Spree::Product.all
  end

  def create
    
  end

  def :destroy
end