class Transaction < ApplicationRecord
  validates :name, presence: true, length: { in: 2..50 }
  validates :amount, presence: true
  belongs_to :author, class_name: 'User'

  scope :total_spent, -> { where(earning: false).sum(:amount) }
  scope :total_earned, -> { where(earning: true).sum(:amount) }
end
