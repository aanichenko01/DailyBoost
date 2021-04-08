class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Each user has many workouts
  has_many :workouts,   dependent: :destroy
  has_many :logged_workouts,   dependent: :destroy
end
