class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :comment, presence: true
  validates :age, presence: true
  has_many :like_relationships, class_name: 'Relationship', foreign_key: :like_id
  has_many :likers, through: :like_relationships, source: :liked

  has_many :liked_relationships, class_name: 'Relationship', foreign_key: :liked_id
  has_many :likeds, through: :liked_relationships, source: :liker
  
  has_many :room_users_1, class_name: 'RoomUser', foreign_key: 'user1_id'
  has_many :room_users_2, class_name: 'RoomUser', foreign_key: 'user2_id'
  has_many :messages

  def liked_by?(user)
    liked = liked_relationships.find_by(like_id: user.id)
    liked.present?
  end

  def have_room?(user1, user2)
    room = Room.where('(user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)', user1.id, user2.id,
                      user2.id, user1.id)
    if room.present?
      return     room.first.id
    else
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
end
