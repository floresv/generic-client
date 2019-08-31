class UsersController < ApplicationController
  include Wor::Paginate
  skip_before_action :verify_authenticity_token

  def index
    render_paginated Spree::User
  end

  def show
    render json: user
  end

  def create
    result = Spree::User.new(update_params)
    return unprocessable_request(result.errors) unless result.save!
    render json: result
  end

  def update
    user.assign_attributes(update_params)
    return unprocessable_request(user.errors) unless user.save!
    render json: user
  end

  def destroy
    return unprocessable_request(user.errors) unless user&.destroy
    head :ok
  end

  private

  def user
    @user ||= Spree::User.find_by_id!(params.require(:id))
  end

  def unprocessable_request(errors)
    render json: { errors: errors.messages }, status: :unprocessable_entity
  end

  def update_params
    params
      .require(:user)
      .permit(
        :encrypted_password,
        :password_salt,
        :email,
        :remember_token,
        :persistence_token,
        :reset_password_token,
        :perishable_token,
        :sign_in_count,
        :failed_attempts,
        :last_request_at,
        :current_sign_in_at,
        :last_sign_in_at,
        :current_sign_in_ip,
        :last_sign_in_ip,
        :login,
        :ship_address_id,
        :bill_address_id,
        :authentication_token,
        :unlock_token,
        :locked_at,
        :remember_created_at,
        :reset_password_sent_at
      )
  end
end