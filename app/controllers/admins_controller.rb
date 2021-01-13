class AdminsController < ApplicationController
  def show
    current_admin
  end

  def create_students
    current_admin
    students = current_admin.schools
    @school_students = Student.where(:school_id => current_admin)
  end

  def create_teachers
    current_admin
    teachers = current_admin.schools
    @school_teachers = Teacher.where(:school_id => current_admin)
  end

  def school_courses
    current_admin
    @schoolcourses = current_admin.courses
  end

  def classes
    current_admin
    @classes = current_admin.grades
  end
end
