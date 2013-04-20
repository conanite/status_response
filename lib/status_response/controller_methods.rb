module StatusResponse
  module ControllerMethods
    def back
      redirect_to (params[:return_to] || :back)
    end

    def unauthorized
      status_response_with_html_format do
        # headers["WWW-Authenticate"] = "html-form login_form" # this would be great, but Opera complains about unrecognised authentication method
        render "errors/401_unauthorized", :status => 401
        false
      end
    end

    def forbidden
      status_response_with_html_format do
        render "errors/403_forbidden", :status => 403
        false
      end
    end

    def not_found
      status_response_with_html_format do
        render "errors/404_not_found", :status => 404
        false
      end
    end

    def status_response_with_html_format
      old_formats = self.formats
      self.formats = [:html]
      return yield
    ensure
      self.formats = old_formats
    end
  end
end