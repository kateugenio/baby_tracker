class ApplicationController < ActionController::Base
  # TODO: Need to check for amazon alexa's request signature and request timestamp!
  # TODO: Verify request came from skill ID too!
  skip_before_action :verify_authenticity_token
end
