class GradesController < ApplicationController
  before_action :teacher_logged_in?
  before_action :student_logged_in?, only: [:index]
  before_action :parent_logged_in?, only: [:index]
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    if session[:user_type] == "parent"
      @parent = Parent.find_by_id(session[:user_id])
      @grades = Grade.where(student_id: session[@parent.student_id])
    else session[:user_type] == "student"
      @student = Student.find_by_id(session[:user_id])
      @grades = Grade.where(student_id: session[:user_id])
      # @grades = Grade.student_id.where(student_id: session[:student_id])
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:assignment_name, :score, :student_in)
    end

    def teacher_logged_in?
      if Teacher.find_by_id(session[:user_id]) && (session[:user_type] == "teacher")
      else
        redirect_to sessions_login_path, notice: 'Please login.'
      end
    end

    def student_logged_in?
      if Student.find_by_id(session[:user_id]) && (session[:user_type] == "student")
      else
        redirect_to sessions_login_path, notice: 'Please login.'
      end
    end

    def parent_logged_in?
      if Parent.find_by_id(session[:user_id]) && (session[:user_type] == "parent")
      else
        redirect_to sessions_login_path, notice: 'Please login.'
      end
    end
  end
end
