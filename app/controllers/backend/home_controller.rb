class Backend::HomeController < ActionController::Base
layout 'spp'
before_filter :authenticate_user!
  def index
  	
  end
end