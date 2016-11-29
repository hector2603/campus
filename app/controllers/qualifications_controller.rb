class QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :es_profesor?, only:[:new, :create,:edit,:update]

  # GET /qualifications
  # GET /qualifications.json
  def index
    @qualifications = Qualification.where(course_id: params[:course_id])
  end

  # GET /qualifications/1
  # GET /qualifications/1.json
  def show 
  end

  # GET /qualifications/new
  def new
    #@qualification = Qualification.new
    @qualifications = Qualification.where(course_id: params[:course_id])

  end

  # GET /qualifications/1/edit
  def edit
  end

  # POST /qualifications
  # POST /qualifications.json
  def create
    puts "actualizandooooooooooooooooooooooooooooooo"
    estudiantes = JSON(params[:q])
    estudiantes.each do |i|
      puts i
      @qualification =Qualification.where( "course_id = ? AND user_id = ?" ,params[:course_id], i["user_id"] )
      @qualification.update(nota: i["nota"])
    end
    redirect_to course_qualifications_path( params[:course_id])
  end

  # PATCH/PUT /qualifications/1
  # PATCH/PUT /qualifications/1.json
  def update
    respond_to do |format|
      if @qualification.update(qualification_params)
        format.html { redirect_to @qualification, notice: 'Qualification was successfully updated.' }
        format.json { render :show, status: :ok, location: @qualification }
      else
        format.html { render :edit }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualifications/1
  # DELETE /qualifications/1.json
  def destroy
    @qualification.destroy
    respond_to do |format|
      format.html { redirect_to qualifications_url, notice: 'Qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualification_params
      params.require(:qualification).permit(:q)
    end
end
