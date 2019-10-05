# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :amps

  def cisco_client
    @cisco_client ||= ApiClient::Factory.cisco(self)
  end

  # def decode_api_client_id
  #   @api_client_id ||= decode(self.api_client_id)
  # end
  #
  # def decode_api_client_key
  #   @api_key ||= decode(self.api_client_id)
  # end
  #
  # def encode_client_id(id)
  #   Base64.encode(id)
  # end
  #
  # def encode_key(key)
  #   Base64.encode(key)
  # end
  #
  # def encode(secret)
  #   Base64.strict_encode64(secret)
  # end
  #
  # def decode(secret)
  #   Base64.strict_decode64(secret)
  # end
end
