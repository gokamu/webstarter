class TeachersController < ApplicationController
  before_action :current_teacher

  def show
    @teacher = Teacher.find(params[:id])
    current_admin
    @school = School.where(id: @teacher.school_id).first
    @schoolcourses = Course.where(:grade_id => @teacher.school_id)
    @schoolgrades = Grade.where(:school_id => @teacher.school_id)
    @gradecourses = Course.where(:grade_id => @teacher.grade_taught)
  end
end
