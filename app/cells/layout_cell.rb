class LayoutCell < ViewModel

  def left(dir1='', dir2='')
    @dir1 = dir1
    @dir2 = dir2
    if current_user && current_user.admin?
      render :left_admin
    end
  end

  def top
    render
  end

  def footer
    render
  end

  def app_footer
    render
  end

  def app_header
    render
  end

  def app_sidebar
    @side = Post.where("is_recommend = ?", true).order(created_at: :desc).limit(5)
    render
  end

  def summary(project)
    
  end
end
