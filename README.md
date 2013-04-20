# StatusResponse

Inserts :forbidden, :unauthorized, and :not_found methods into ApplicationController::Base. Use these methods in before_filters, or in rescue_from handlers.

## Installation

Add this line to your application's Gemfile:

    gem 'status_response'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install status_response

This gem provides default templates using HAML, but doesn't have an explicit dependency on HAML, so you are free to provide your own templates using another language. If you want to use the default templates, add

    gem 'haml'

to your application's Gemfile.

## Usage

Mixes the following methods into your ApplicationController

    #forbidden

    #not_found

    #unauthorized

:forbidden renders with status 403, :not_found with 404, and :unauthorized with 401. Use #not_found as an error handler:

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

This will render "errors/404_not_found", either the default one packaged in the gem, or the override in your view path.

#unauthorized you can use in a #before_filter:

    before_filter :require_current_user

    def require_current_user
      current_user.present? || unauthorized
    end

This will render "errors/401_unauthorized", either the default one packaged in the gem, or the override in your view path.

Likewise for #forbidden:

    before_filter :require_widget_access

    def require_widget_access
      @widget.visible_to?(current_user) || forbidden
    end

This will render "errors/403_forbidden", either the default one packaged in the gem, or the override in your view path.

If the current request is for a format other than HTML, these methods render HTML in any case, by switching the
controllers #formats property temporarily just before rendering. So if your user tries to access a PDF, but there is a problem,
the response will be in HTML anyway.

TODO: I haven't figured out testing this yet. Watch this space. Any tips appreciated.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
