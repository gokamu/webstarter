class StudentCoursesController < ApplicationController
  before_action :authenticate_admin!

  def create
    @course = Course.find(params[:followed_id])
    @student = Student.find(params[:follower_id])
    @student.follow(@course)
    redirect_to school_student_path(@student.school, @student)
  end

  def destroy
    @course = StudentCourse.find(params[:id]).followed
    @student = Student.find(params[:follower_id])
    @student.unfollow(@course)
    redirect_to school_student_path(@student.school, @student)
  end
end
