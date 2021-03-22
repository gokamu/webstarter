class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @admin = Admin.find(params[:id])
  end

  def create_students
    current_admin
    students = current_admin.school
    @school_students = Student.where(:school_id => current_admin)
  end

  def create_teachers
    teachers = current_admin.school
    @school_teachers = Teacher.where(:school_id => current_admin)
  end

  def classes
    @classes = current_admin.grades
  end
end
