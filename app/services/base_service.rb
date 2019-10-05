# frozen_string_literal: true

class BaseService
  attr_accessor :user

  def initialize(user: nil)
    admin_user = User.last
    @user = admin_user
  end
end
