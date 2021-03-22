class TestScoresController < ApplicationController
  before_action :set_test_score, only: [:show, :edit, :update, :destroy]

  def create
    @test_score = TestScore.new(test_score_params)
    if @test_score.save
      flash[:notice] = "test score successfully created"
      redirect_to school_grade_course_path(current_teacher.school_id, @test.course.grade, @test.course)
    else
      flash[:alert] = "Something went wrong"
      render "new"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_score
    @note = TestScore.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_score_params
    params.require(:test_score).permit(:score, :student_id, :test_id)
  end
end
