class SchoolsController < ApplicationController
  before_action :find_school, only: :show
  before_action :set_school, only: [:edit, :update, :destroy]
 
  def index
    @schools = School.all
  end


  def show
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

  def find_school
    if request.subdomain == 'www'
      req = request.host[4..-1]
    else
      req = request.host
    end

    # first test if there exists a Site with the requested domain,
    # then check if it's a subdomain of the application's main domain
    @site = School.find_by(domain: req) || School.find_by(slug: request.subdomain)

    # if a matching site wasn't found, redirect the user to the www.<root url>
    redirect_to root_url(subdomain: 'www') unless @site
  end

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :description, :logo, :banking, :address, :contact, :domain)
  end
end
