class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :comment, presence: true
  validates :age, presence: true
  has_many :like_relationships, class_name: "Relationship", foreign_key: :like_id
  has_many :likers, through: :like_relationships, source: :liked

  has_many :liked_relationships, class_name: "Relationship", foreign_key: :liked_id
  has_many :likeds, through: :liked_relationships, source: :liker

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
end
