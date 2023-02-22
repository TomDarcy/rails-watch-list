class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
  #  should not be able to destroy self if has bookmarks children
end
