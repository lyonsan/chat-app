class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  #messageのcontentがないと投稿できないバリデーションを、
  #画像がattachedじゃない時だけに限定している
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
