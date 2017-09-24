class Author < ApplicationRecord
  belongs_to :book
  validates :name, length: {maximum: 50}

end
