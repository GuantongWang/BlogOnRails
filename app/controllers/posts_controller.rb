class PostsController < AppController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.update(view: @post.view + 1)
  end

  def recommend
    @posts = Post.where("is_recommend = ?", true).order(created_at: :desc)
  end

  def like
    @like = Post.find(params[:post_id])
    @like.update(like: @like.like + 1)
    render json: {status:'success'}.to_json
  end
end
