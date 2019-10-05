# frozen_string_literal: true

class Api::V1::AmpsController < Api::V1::BaseController
  def fetch
    @user = User.last
    res = AmpsService.new(user: @user).dump_amp
    render json: res.to_json
  end
end
