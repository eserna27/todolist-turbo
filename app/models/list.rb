class List < ApplicationRecord
  validates :title, presence: true
  has_many :todos, dependent: :destroy
end
