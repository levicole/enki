class Admin::BaseController < ApplicationController
  include AuthenticatedSystem
  
  layout 'admin'

  before_filter :login_required

  protected
  def set_content_type
    headers['Content-Type'] ||= 'text/html; charset=utf-8'
  end
end
