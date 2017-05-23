class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_id
  belongs_to :post
  belongs_to :user
  has_ancestry
end
