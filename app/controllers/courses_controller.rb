class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    notes = Course.all
    tests = Test.all
    assignments = Assignment.all
    @noteslist = @course.notes
    @testslist = @course.tests
    @assignmentslist = @course.assignments
    @course_students = @course.followers
    @auth_admin = admin_signed_in? && school_grade_course_path(current_admin.school.id, @course.grade, @course)
    @auth_course = school_grade_course_path(@course.grade.school_id, @course.grade, @course)
    @auth_student = student_signed_in? && current_student.following?(@course)
    @auth_teacher = teacher_signed_in? && current_teacher.course_taught?(@course) 

    # this redicts users who are not authorized to access the course show page
    if !(@auth_admin == @auth_course || @auth_student || @auth_teacher)
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

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to school_grade_course_path(current_admin.school.id, @course.grade, @course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :grade_id)
  end
end
