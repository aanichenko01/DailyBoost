module ExerciseHelper

    def get_exercise_by_category(category)
        return HTTParty.get('https://wger.de/api/v2/exercise/?language=2&limit=500&category=' + category.to_s).parsed_response
    end

end