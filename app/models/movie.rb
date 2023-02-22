class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  def to_s
    title
  end

  def self.search(query)
    where('title ILIKE ?', "%#{query}%")
  end

  def rating=(value)
    self[:rating] = value.to_f.round(1)
  end
end
