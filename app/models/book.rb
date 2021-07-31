class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :introduction, presence: true
end
