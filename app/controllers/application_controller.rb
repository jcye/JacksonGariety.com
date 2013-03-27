class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :clog

  def clog(text)
    Rails.logger.debug("\033[0;31;05m" + text + "\033[0;37m")
  end
end
