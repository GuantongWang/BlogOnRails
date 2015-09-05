class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments
    validates :title, presence: true

  def get_feature_pic
    @match = content.match(/<img.*?>/)
    if @match
      @match[0]
    else
      '<img src="/uploads/default.jpeg" alt="" />'
    end
  end

  def get_preview
    content.gsub(/<img.*?>/,"")
  end

  def get_views
    @view = view
    if @view == 0
      '0 view'
    else
      "#{@view} views"
    end
  end

  def get_comments
    @comment = comments.size
    if @comment == 0
      '0 comment'
    else
      "#{@comment} comments"
    end
  end

end
