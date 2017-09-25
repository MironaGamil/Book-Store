class Author < ApplicationRecord
  belongs_to :book
  validates :name, presence: true, length: {maximum: 50}

end
