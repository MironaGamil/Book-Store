class Author < ApplicationRecord
  belongs_to :book
  validates :book_id, presence: true
  validates :name, presence: true, length: {maximum: 50}

end
