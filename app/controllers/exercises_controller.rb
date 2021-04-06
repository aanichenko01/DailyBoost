class ExercisesController < ApplicationController
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
    @exercise.title = params[:title].to_s
    @exercise.category = params[:category].to_i
    @exercise.description = params[:description].to_s
    @exercise.equipment = params[:equipment].to_s
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
      puts params.inspect
      params.require(:exercise).permit(:workout_id, :title, :category, :description, :equipment, :sets, :reps)
    end

    def set_workout
      @workout = Workout.find_by(id: params[:workout_id]) || Workout.find(exercise_params[:workout_id])
     end
end
