class LoggedWorkout < ApplicationRecord
<<<<<<< Updated upstream
    #Each workout entry is associated to a user
    belongs_to :user
   
    #Each workouts must have a name
    validates :name, presence: true
=======

    #Each logged workout entry is associated to a user
    belongs_to :user
    
    #Each workouts must have a dateand name
    validates :date, :name, presence: true
>>>>>>> Stashed changes

    #Scope to show workouts only associated to specific user
    scope :user_logged_workouts, ->(user) { where(['user_id = ?', user.id]) }
end
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
