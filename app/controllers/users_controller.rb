class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def login
    return head :forbidden unless params['user'] == 'admin@email.com' && params['password'] == '12345'
    head :no_content
  end
end