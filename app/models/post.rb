class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  def post_excerpt
    body = self.body
    body.truncate(250).html_safe
  end

end
