class Blog < ApplicationRecord
  has_one_attached :image
  has_one_attached :thumbnail
end
