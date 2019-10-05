# frozen_string_literal: true

class Resources::Amp < Resources::Base

  def self.fetch
    cisco_client.get
  end
end
