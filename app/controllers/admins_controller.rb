class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @admin = Admin.find(params[:id])

    if !(current_admin == @admin)
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

  def create_students
    current_admin
    students = current_admin.school
    @school_students = Student.where(:school_id => current_admin.school.id)

    if !(@school_students)
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

  def create_teachers
    teachers = current_admin.school
    @school_teachers = Teacher.where(:school_id => current_admin.school.id)

    if !(@school_teachers)
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

  def classes
    @classes = current_admin.grades

    if !(@classes)
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

  def posts
    @blogs = Blog.where(:school_id => current_admin.school.id)
  end
end
