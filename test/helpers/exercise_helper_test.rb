class ExerciseHelperTest < ActionView::TestCase
  
    test "API call should return a Hash" do 
        assert get_exercise_by_category(8).class.eql? Hash
    end
    
    test "should only get exercises with specified category " do
        
        get_exercise_by_category(8)["results"].each do |post|
            assert post["category"].eql? 8
        end
    end

    test "should get name of first returned exercise from WgerWorkout API" do
        assert get_exercise_by_category(8)["results"].first["name"].present?
    end

    test "should get description of first returned exercise from WgerWorkout API" do
        assert get_exercise_by_category(8)["results"].first["description"].present?
    end

    test "should get equipment of first returned exercise from WgerWorkout API" do
        assert get_exercise_by_category(8)["results"].first["equipment"].present?
    end


end