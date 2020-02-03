# Represents application Member, currently only with :email and :name attributes
class Member < ApplicationRecord
  has_many :invites, dependent: :destroy

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true
end
