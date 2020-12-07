class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many_attached :images
  has_many :reads, dependent: :destroy
  has_many :read_users, through: :reads, source: :user

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.images.attached?
  end

  default_scope -> { order(created_at: :desc) }
end