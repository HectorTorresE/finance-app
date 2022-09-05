class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups, through: :user
  validates :name, :amount, presence: true
end
