class ProductsController < ApplicationController
  include Wor::Paginate
  skip_before_action :verify_authenticity_token

  def index
    render_paginated Spree::Product
  end

  def show
    render json: product
  end

  def create
    result = Spree::Product.new(update_params)
    return unprocessable_request(result.errors) unless result.save!
    render json: result
  end

  def update
    product.assign_attributes(update_params)
    return unprocessable_request(product.errors) unless product.save!
    render json: product
  end

  def destroy
    return unprocessable_request(product.errors) unless product.destroy
    head :ok
  end

  private

  def product
    @product ||= Spree::Product.find_by(id: params.require(:id))
  end

  def unprocessable_request(errors)
    render json: { errors: errors.messages }, status: :unprocessable_entity
  end

  def update_params
    params
      .require(:product)
      .permit(
        :name,
        :description,
        :available_on,
        :permalink,
        :meta_description,
        :meta_keywords,
        :tax_category_id,
        :shipping_category_id,
        :count_on_hand
      )
  end
end