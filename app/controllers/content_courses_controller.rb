class ContentCoursesController < ApplicationController
  before_action :set_content_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html
  before_action :es_profesor?, only:[:new, :create,:edit,:update]
  before_action :verificar_curso, only:[:new,:edit,:update,:show]
  before_action :curso_activo?, only:[:new,:edit,:update,:show]
  # GET /content_courses
  # GET /content_courses.json
  def index
    @content_courses = ContentCourse.all
  end

  # GET /content_courses/1
  # GET /content_courses/1.json
  def show
  end

  # GET /content_courses/new
  def new
    course = Course.find(params[:course_id])
    @content_course = course.content_courses.build
  end

  # GET /content_courses/1/edit
  def edit
  end

  # POST /content_courses
  # POST /content_courses.json
  def create
    @content_course = ContentCourse.new(content_course_params)

    respond_to do |format|
      if @content_course.save
        format.html { redirect_to course_user_path(params[:course_id]), notice: 'Content course was successfully created.' }
        format.json { render :show, status: :created, location: @content_course }
      else
        format.html { render :new }
        format.json { render json: @content_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_courses/1
  # PATCH/PUT /content_courses/1.json
  def update
    respond_to do |format|
      if @content_course.update(content_course_params)
        format.html { redirect_to course_user_path(params[:course_id]), notice: 'Content course was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_course }
      else
        format.html { render :edit }
        format.json { render json: @content_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_courses/1
  # DELETE /content_courses/1.json
  def destroy
    @content_course.destroy
    respond_to do |format|
      format.html { redirect_to course_user_path(params[:course_id]), notice: 'Content course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_course
      course = Course.find(params[:course_id])
      @content_course = course.content_courses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_course_params
      params.require(:content_course).permit(:course_id, :content,:file)
    end
end
