class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6, message: "characters is the minimum allowed" }
  validates :movie_id, uniqueness: { scope: :list_id, message: "this movie is already in" }
end
