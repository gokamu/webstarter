class TeacherCoursesController < ApplicationController
  def create
    @course = Course.find(params[:followed_id])
    @teacher = Teacher.find(params[:follower_id])
    @teacher.add_teacher_to_course(@course)
    redirect_to @teacher
  end

  def destroy
    @course = TeacherCourse.find(params[:id]).followed
    @teacher = Teacher.find(params[:follower_id])
    @teacher.remove_teacher_from_course(@course)
    redirect_to @teacher
  end
end
