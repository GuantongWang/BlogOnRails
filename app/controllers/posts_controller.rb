class PostsController < AppController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.update(view: @post.view + 1)
  end
end
