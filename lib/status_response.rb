require "status_response/version"
require "status_response/controller_methods"

module StatusResponse
  class Engine < Rails::Engine
    initializer "status_response.controller_methods" do |app|
      ActionController::Base.send :include, StatusResponse::ControllerMethods
    end
  end
end

