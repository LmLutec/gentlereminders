class Reminder < ApplicationRecord
    validates :message, presence: true
    validates :message, uniqueness: true
end
