class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades/1
  # GET /grades/1.json
  def show
    current_admin
    @grade_students = Student.where(grade_id: @grade.id)
    @schoolcourses = Course.where(grade_id: @grade.id)

    if !(admin_signed_in? && current_admin.grades)
      if current_admin
        redirect_to school_path(current_admin.school.id)
      elsif current_student
        redirect_to school_path(current_student.school_id)
      elsif current_teacher
        redirect_to school_path(current_teacher.school_id)
      else
        redirect_to root_path
      end
      flash[:alert] = "You are not authorized!"
    end
  end

  # GET /grades/new
  def new
    @school = School.find(params[:id])
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
        format.html { redirect_to admin_classes_path(current_admin), notice: "Grade was successfully created." }
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
        format.html { redirect_to @grade, notice: "Grade was successfully updated." }
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
      format.html { redirect_to grades_url, notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grade_params
    params.require(:grade).permit(:name, :school_id)
  end
end
