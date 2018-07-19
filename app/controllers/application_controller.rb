class ApplicationController < ActionController::Base
  include Rescuable
  
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid, with: :rescue_bad_request_error

end
