class ExercisesController < ApplicationController
  include HTTParty
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :set_workout, only: [:new, :create]
  # Page can only be accessed if user is logged in
  before_action :authenticate_user!

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = @workout.exercises.new
    @response = get_exercise_by_category
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = @workout.exercises.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: I18n.t('exercises.created') }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: I18n.t('exercises.updated') }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.js #-> loads destroy.js.erb
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:workout_id, :title, :category, :description, :equipment, :sets, :reps)
    end

    def set_workout
      @workout = Workout.find_by(id: params[:workout_id]) || Workout.find(exercise_params[:workout_id])
     end

     def get_exercise_by_category
      return HTTParty.get('https://wger.de/api/v2/exerciseinfo/?language=2&limit=20').parsed_response
    end
end
