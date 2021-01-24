class StudentsController < ApplicationController
  before_action :current_student

  def show
    @student = Student.find(params[:id])
    current_admin
    grade = params[:grade]
    @schoolcourses = Course.where(:grade_id => @student.grade_id)
  end
end
