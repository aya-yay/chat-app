class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
                                      # テキストが存在していなくても、画像の投稿が可能となった

  def was_attached?
    self.image.attached?
  end
end