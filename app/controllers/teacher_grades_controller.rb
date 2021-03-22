class TeacherGradesController < ApplicationController
  def create
    @grade = Grade.find(params[:followed_id])
    @teacher = Teacher.find(params[:follower_id])
    @teacher.add_teacher_to_grade(@grade)
    redirect_to @teacher
  end

  def destroy
    @grade = TeacherGrade.find(params[:id]).followed
    @teacher = Teacher.find(params[:follower_id])
    @teacher.remove_teacher_from_grade(@grade)
    redirect_to @teacher
  end
end
