class LoggedWorkout < ApplicationRecord
    #Each workout entry is associated to a user
    belongs_to :user
   
    #Each workouts must have a name
    validates :name, presence: true

    #Scope to show workouts only associated to specific user
    scope :user_logged_workouts, ->(user) { where(['user_id = ?', user.id]) }
end
