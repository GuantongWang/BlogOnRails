class Admin::PostsController < Admin::AdminController
  include ResourceControllerMixin

  PAGE_SIZE = 20

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def set_recommend
    @recommend = Post.find(params[:post_id])
    @recommend.update(is_recommend: true)
    redirect_to admin_posts_path
  end

  def set_unrecommend
    @recommend = Post.find(params[:post_id])
    @recommend.update(is_recommend: false)
    redirect_to admin_posts_path
  end
  private
  def set_dirs
    @dir1 = 'posts'
  end

  def set_resource
    @post = Post.find(params[:id])
  end

  def resource
    @post
  end

  def build_resource
    @post = Post.new resource_params
  end

  def resource_params
    params.require(:post).permit(:title, :content)
  end

  def redirect_to_after_save
    [:admin, :posts]
  end

end