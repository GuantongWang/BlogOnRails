module ResourceControllerMixin

  def self.included(base)
    base.before_action :set_resource, only: [:show, :edit, :update, :destroy, :recommend, :unrecommend, :activate, :inactivate]
  end

  def create
    @resource = build_resource
    if @resource.save
      redirect_to redirect_to_after_save
    else
      render action: 'new'
    end
  end

  def edit

  end

  def update
    resource.update(resource_params)
    if resource.save
      redirect_to redirect_to_after_save
    else
      render 'edit'
    end
  end

  def destroy
    resource.destroy
    redirect_to :back
  end

  def recommend
    resource.update_attribute(:recommended, true)
    render nothing: true
  end

  def unrecommend
    resource.update_attribute(:recommended, false)
    render nothing: true
  end

  def activate
    activated_at = resource.activated_at || Time.now
    resource.update_attributes active: true, activated_at: activated_at
    render nothing: true
  end

  def inactivate
    resource.update_attribute(:active, false)
    render nothing: true
  end
end
