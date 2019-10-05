# frozen_string_literal: true

class AmpClientBuilder
  def intialize(user)
    @user = user
  end

  def amp_client
    ApiClient::Factory.amp(user)
  end
end
