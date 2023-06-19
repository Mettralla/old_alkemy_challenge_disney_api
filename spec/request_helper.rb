# frozen_string_literal: true 

# spec/support/request_helper.rb

# Module containing helper methods for handling API responses
module RequestHelper
  # Parses the response body into a JSON object
  def response_body
    JSON.parse(response.body)
  end
end
