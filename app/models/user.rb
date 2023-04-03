class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_tournaments, dependent: :destroy
  has_many :tournaments, through: :user_tournaments
  has_many :teams, dependent: :destroy
  has_many :user_matches
  has_many :matches, through: :user_matches
  has_many :team_matches, through: :teams
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
