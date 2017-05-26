class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_id, :user_id, :post_id
  belongs_to :post, counter_cache: true
  belongs_to :user, counter_cache: true
  has_ancestry
end
