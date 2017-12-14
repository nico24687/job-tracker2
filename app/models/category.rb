class Category < ApplicationRecord 
  validates :title, presence: true, uniqueness: true
  has_many :jobs, dependent: :delete_all
end 