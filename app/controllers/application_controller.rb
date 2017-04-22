class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  #
  # set_time_zone
  #
  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
