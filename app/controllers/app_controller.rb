class AppController < ActionController::Base
  def self.included(base)
    base.layout :"app"
  end

end
