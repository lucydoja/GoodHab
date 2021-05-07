class Category < ApplicationRecord
	validates :name, uniqueness: { case_sensitive: true }
	belongs_to :user
end
