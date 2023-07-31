class RoomUser < ApplicationRecord
  has_many :messages
end
