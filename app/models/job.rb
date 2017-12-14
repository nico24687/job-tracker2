class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category 
  # has_many :comments, -> { order(created_at: :desc) }, dependent: :delete_all
  has_many :comments, dependent: :delete_all
end
