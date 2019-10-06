# frozen_string_literal: true

class AmpsController < ApplicationController
  before_action :authenticate_user!

  def index
    response = current_user.amps
    @amps = parse_response(response)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @amps }
    end
  rescue StandardError => e
    e.message
  end

  def show; end

  def parse_response(response)
    response.pluck(:event_data)
  end
end
