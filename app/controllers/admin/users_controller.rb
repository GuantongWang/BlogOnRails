class Admin::UsersController < Admin::AdminController
  include ResourceControllerMixin

  PAGE_SIZE = 20

  def index
    @users = User.where.not(id: 1)
  end

  def new
    @user = User.new
  end

  private
  def set_dirs
    @dir1 = 'users'
  end

  def set_resource
    @user = User.find(params[:id])
  end

  def resource
    @user
  end

  def build_resource
    @user = User.new resource_params
  end

  def resource_params
    params.require(:user).permit(:name, :phone, :email, :role, :password, :password_confirmation, :active)
  end  

  def redirect_to_after_save
    [:admin, :users]
  end  
end
