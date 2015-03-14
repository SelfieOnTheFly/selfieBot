include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds

class ApplicationController < ActionController::API

  # HTTP Header Pagination
  # Add set_pagination_headers only: [:index] in controller
  def self.set_pagination_headers(options = {})
    after_filter(options) do |controller|
      results = instance_variable_get("@#{controller_name}") # @ressource
      headers['Pagination-current_page'] = results.current_page.to_s
      headers['Pagination-per_page'] = results.per_page.to_s
      headers['Pagination-total_entries'] = results.total_entries.to_s
    end
  end

end
