# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :amps

  # TODO: make this encrypted key to a env variable
  ENCRYPTION_KEY = "\x86\xCC?V\xF0\xF3\xEE\x8Du\xABH@ gn\x85\xF4\xF89\xF8kk\xFC\x14Y\x8C\x98t\xF2V3\x11"

  attr_encrypted :api_key, key: ENCRYPTION_KEY
  attr_encrypted :api_client_id, key: ENCRYPTION_KEY

  def cisco_client
    @cisco_client ||= ApiClient::Factory.cisco(self)
  end
end
