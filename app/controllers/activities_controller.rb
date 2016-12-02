class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /activities
  # GET /activities.json
  def index
    @activities = initialize_grid(Activity.all)
    authorize Activity
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    authorize Activity, :index?
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @activity.project_id = params[:project_id] if params[:project_id]
    authorize Activity, :project_manager?
  end

  # GET /activities/1/edit
  def edit
    authorize Activity, :project_manager?
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    authorize Activity, :project_manager?

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Atividade criada com sucesso.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    authorize Activity, :project_manager?
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Atividade atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    authorize Activity, :project_manager?
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Atividade deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :description, :begin_date,
                                        :end_date, :status, :user_id,
                                        :project_id)
    end
end
