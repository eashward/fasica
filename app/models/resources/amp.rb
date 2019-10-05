# frozen_string_literal: true

class Resources::Amp < Resources::Base
  attributes

  def self.fetch
    cisco_client.get
  end
end
