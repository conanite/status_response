module StatusResponse
  module ControllerMethods
    def back                           ; redirect_to (params[:return_to] || :back) ; end
    def layout_for_error_status status ; "application"                             ; end

    def unauthorized
      status_response_with_html_format do
        # headers["WWW-Authenticate"] = "html-form login_form" # this would be great, but Opera complains about unrecognised authentication method
        render "errors/401_unauthorized", :status => 401, :layout => layout_for_error_status(401)
        false
      end
    end

    def forbidden
      status_response_with_html_format do
        render "errors/403_forbidden", :status => 403, :layout => layout_for_error_status(403)
        false
      end
    end

    def not_found msg=nil
      status_response_with_html_format do
        render "errors/404_not_found", :status => 404, :layout => layout_for_error_status(404), :msg => msg
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
