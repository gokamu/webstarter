class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      flash[:notice] = "assignment successfully created"
      redirect_to school_grade_course_path(current_teacher.school_id, @assignment.course.grade, @assignment.course)
    else
      flash[:alert] = "Something went wrong"
      render "new"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @note = assignment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assignment_params
    params.require(:assignment).permit(:name, :file, :course_id)
  end
end
