module Spree
  class UserSerializer < ActiveModel::Serializer
    attributes :encrypted_password,
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
  end
end
