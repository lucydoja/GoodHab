class HabitsController < ApplicationController
  before_action :set_habit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /habits or /habits.json
  def index
    if params[:search]
      @habits = Habit.where(date: params[:search])
    else 
      @habits = Habit.where(date: Date.today)
    end
  end

  # GET /habits/1 or /habits/1.json
  def show
  end

  # GET /habits/new
  def new
    @habit = Habit.new
  end

  # GET /habits/1/edit
  def edit
  end

  # POST /habits or /habits.json
  def create
    @habit = Habit.new(habit_params)

    respond_to do |format|
      if @habit.save
        format.html { redirect_to habits_path, notice: "Log was successfully added." }
        format.json { render :show, status: :created, location: @habit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habits/1 or /habits/1.json
  def update
    respond_to do |format|
      if @habit.update(habit_params)
        format.html { redirect_to habits_path, notice: "Log was successfully edited." }
        format.json { render :show, status: :ok, location: @habit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habits/1 or /habits/1.json
  def destroy
    @habit.destroy
    respond_to do |format|
      format.html { redirect_to habits_url, notice: "Log was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habit
      @habit = Habit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def habit_params
      params.require(:habit).permit(:date, :category, :hours, :minutes, :description, :user_id)
    end
end
