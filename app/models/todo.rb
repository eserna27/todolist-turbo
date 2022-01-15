class Todo < ApplicationRecord
  validates :name, presence: true
  belongs_to :list

  def toggle!
    if completed_at?
      update(completed_at: nil)
    else
      touch(:completed_at)
    end
  end
end
