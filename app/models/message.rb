class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  has_many :reads, dependent: :destroy
  has_many :read_users, through: :reads, source: :user

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  default_scope -> { order(created_at: :desc) }
end