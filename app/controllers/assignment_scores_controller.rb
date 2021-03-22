class AssignmentScoresController < ApplicationController
  before_action :set_assignment_score, only: [:show, :edit, :update, :destroy]

  def create
    @assignment_score = AssignmentScore.new(assignment_score_params)
    if @assignment_score.save
      flash[:notice] = "Assignment score successfully created"
      redirect_to @assignment.course
    else
      flash[:alert] = "Something went wrong"
      render "new"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment_score
    @note = AssignmentScore.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assignment_score_params
    params.require(:assignment_score).permit(:score, :student_id, :assignment_id)
  end
end
