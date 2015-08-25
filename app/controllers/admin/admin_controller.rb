class Admin::AdminController < ApplicationController
  layout 'back_office'
  before_action :authenticate_user!
end
