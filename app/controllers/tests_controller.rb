class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:notice] = "Test successfully created"
      redirect_to school_grade_course_path(current_teacher.school_id, @test.course.grade, @test.course)
    else
      flash[:alert] = "Something went wrong"
      render "new"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @note = Test.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_params
    params.require(:test).permit(:name, :file, :course_id)
  end
end
