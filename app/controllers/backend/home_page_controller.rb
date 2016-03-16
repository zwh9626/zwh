class Backend::HomePageController < ActionController::Base
layout 'spp'
before_filter :authenticate_user!
  def index
  	
  end
end