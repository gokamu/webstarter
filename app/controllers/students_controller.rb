class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    current_admin
    @school = School.where(id: @student.school_id).first
    @schoolcourses = Course.where(:grade_id => @student.grade_id)

    if !(current_student == @student || admin_signed_in? && current_admin.id == @school.admin_id || teacher_signed_in? && current_teacher.school.id == @student.school_id)
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
