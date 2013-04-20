# StatusResponse

TODO: Write a gem description

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

#forbidden renders with status 403, #not_found with 404, and #unauthorized with 401. Use #not_found as an error handler:

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

#unauthorized you can use in a #before_filter:

    before_filter :require_current_user

    def require_current_user
      current_user.present? || unauthorized
    end

Likewise for #forbidden:

    before_filter :require_widget_access

    def require_widget_access
      @widget.visible_to?(current_user) || forbidden
    end

Sometimes you need access control for PDF documents, but you don't want to render a PDF that just tells
your user they can't access this PDF (especially if they download it, assume it's there, and save it
without looking at it). So instead of rendering an error page directly in PDF, it makes more sense to redirect





TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
