class TeachersController < ApplicationController
  before_action :current_teacher

  def show
    @teacher = Teacher.find(params[:id])
    current_admin
    @school = School.where(id: @teacher.school_id).first
    @schoolcourses = Course.where(:grade_id => @school.grades.ids)
    @schoolgrades = Grade.where(:school_id => @teacher.school_id)
    @gradecourses = Course.where(:grade_id => @teacher.grade_taught)

    if !(admin_signed_in? && current_admin.id == @school.admin_id || current_teacher == @teacher)
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
end
