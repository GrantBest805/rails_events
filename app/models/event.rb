class Event < ActiveRecord::Base
  belongs_to :user
  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :users, through: :posts
  validates :name, :location, :state, presence: true
  validates :date, presence: true, inclusion: { in: (Date.today..Date.today+5.years) }
end
