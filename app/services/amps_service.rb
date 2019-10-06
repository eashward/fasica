# frozen_string_literal: true

class AmpsService < BaseService
  delegate :cisco_client, to: :user

  def fetch_amp
    cisco_client.amps
  end

  def by_connector_guid(uuid:)
    cisco_client.amps_by_connector_guid(uuid: uuid)
  end

  def dump_amp
    amps = fetch_amp
    amps['data'].each_slice(100) do |chunk|
      chunk.each do |amp|
        user.amps.new(event_data: amp).save!
      end
    end
  rescue StandardError => e
    e
  end

  def dump_amps_by_cnctr_guid
    amps = user.amps.map { |amp| amp[:event_data] }
    guids = amps.map { |data| data['connector_guid'] }
    by_connector_guid(uuid: guids.last).tap do |amp|
      user.amps.new(event_data: amp).save!
    end
  rescue StandardError => e
    e
  end
end
