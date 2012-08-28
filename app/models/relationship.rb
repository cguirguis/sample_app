class Relationship < ActiveRecord::Base
  attr_accessible :followed_id
  # removed follower_id... why?

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # Rails infers the names of the fkeys from the corresponding symbols
  # ex. follower -> follower_id
  # Need to specify class since follower/followed have no class models

  validates :follower_id, presence: true
  validates :followed_id, presence: true

end
