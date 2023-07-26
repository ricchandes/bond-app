class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :comment, presence: true
  validates :age, presence: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
end