class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
 
  def index
    @schools = School.all
  end


  def show
    @school = School.find_by(custom_domain: request.host) || School.find(params[:id])
    check_signed_user
    @blogs = Blog.where(school_id: @school.id)
  end

  def new
    @school = School.new
  end

  def edit
  end

  def create
    @school = current_admin.create_school(school_params)
    respond_to do |format|
      if @school.save
        format.html { redirect_to current_admin, notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: "School was successfully updated." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :description, :logo, :banking, :address, :contact, :custom_domain)
  end
end
