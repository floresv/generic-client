class LoginController < ApplicationController
  protect_from_forgery with: :null_session

  def login
    return head :forbidden unless params['user'] == 'admin@email.com' && params['password'] == '12345'
    render json: { access_token: 'aO2Z80ymbX' }
  end
end