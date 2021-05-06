class Category < ApplicationRecord
	validates :name, uniqueness: { case_sensitive: true }
end
