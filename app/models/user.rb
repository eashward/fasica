# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :amps
 #TODO: make encrypted key to a env variable
  attr_encrypted :api_key, :api_client_id, key: SecureRandom.random_bytes(32)

  def cisco_client
    @cisco_client ||= ApiClient::Factory.cisco(self)
  end

end
