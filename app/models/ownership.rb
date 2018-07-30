class Ownership < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :item, foreign_key: :item_id
end
