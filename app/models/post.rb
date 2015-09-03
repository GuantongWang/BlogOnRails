class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

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
end
