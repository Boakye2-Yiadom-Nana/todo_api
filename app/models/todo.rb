class Todo < ApplicationRecord
    validates :title, presence: true
    validates :completed, inclusion: { in: [true, false] }
    validates :description, presence: true
    validates :description, length: { minimum: 10 }
    validates :title, length: { maximum: 100 }

    validate :title_cannot_be_completed_if_empty

    def completed?
        completed
    end

    private

    def title_cannot_be_completed_if_empty
        if title.blank? && completed?
            errors.add(:title, "cannot be empty if the todo is marked as completed")
        end
    end
end
