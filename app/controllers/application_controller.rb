class ApplicationController < ActionController::API

  before_action :get_current_admin
  def get_current_admin
      if request.headers['uid'].present?
        admin = User.find_by(email: request.headers['uid'])
        @current_api_admin = admin.present? ? admin : nil
      else
        @current_api_admin = nil
      end
      @current_api_admin
  end
end
