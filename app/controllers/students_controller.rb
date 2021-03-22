class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    current_admin
    @school = School.where(id: @student.school_id).first
    @schoolcourses = Course.where(:grade_id => @student.grade_id)
  end
end
