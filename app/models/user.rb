class User < ApplicationRecord
  has_one_attached :avatar
  # validates :avatar, attached: true, content_type: %w[image/png image/jpg image/jpeg]
end
