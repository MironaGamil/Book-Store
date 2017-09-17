class Book < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	validates :title, presence: true, length: {maximum: 100}
	validates :publisher, presence: true, length: {maximum: 50}
	validates :ISBN, presence: true
	validates :publish_date, presence: true

end
