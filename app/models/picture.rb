class Picture < ApplicationRecord
  validates :content,  length: { in: 1..140 }
  validates :content, presence: true
end
