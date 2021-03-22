class TeacherGradesController < ApplicationController
  def create
    @grade = Grade.find(params[:followed_id])
    @courses = Course.where(grade_id: @grade.id)
    @teacher = Teacher.find(params[:follower_id])
    @teacher.add_teacher_to_grade(@grade)
    @teacher.add_teacher_to_course(@courses)
    redirect_to school_teacher_path(@teacher.school, @teacher)
  end

  def destroy
    @grade = TeacherGrade.find(params[:id]).followed
    @courses = Course.where(grade_id: @grade.id)
    @teacher = Teacher.find(params[:follower_id])
    @teacher.remove_teacher_from_grade(@grade)
    @teacher.remove_teacher_from_course(@courses)
    redirect_to school_teacher_path(@teacher.school, @teacher)
  end
end
