class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, through: :user
  validates :name, presence: true
end
