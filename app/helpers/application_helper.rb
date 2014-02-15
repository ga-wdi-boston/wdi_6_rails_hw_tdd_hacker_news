module ApplicationHelper
  def vote_count(votable)
    post_found = Post.find(votable.id)
    post_found.votes.where(direction: true).count - post_found.votes.where(direction: false).count
  end

  def vote_count_comment(votable)
    comment_found = Comment.find(votable.id)
    comment_found.votes.where(direction: true).count - comment_found.votes.where(direction: false).count
  end
  # If the post has been post more than 1 day, it will disapear from the main page
  def decay(post)
    post = Post.find(post.id)
    (Time.now - post.created_at)/86400
  end
end
