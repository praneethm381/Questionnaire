module Rescuable
  extend ActiveSupport::Concern

  def rescue_bad_request_error
    render status: :bad_request, json: { code: 400, message: 'Bad Request Error' }
  end

end