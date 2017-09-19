class Book < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	validates :title, presence: true, length: {maximum: 100}
	validates :publisher, presence: true, length: {maximum: 50}
	validates :ISBN, presence: true, uniqueness: true
	validates :publish_date, presence: true
	has_many :authors, dependent: :destroy
	accepts_nested_attributes_for  :authors


end
