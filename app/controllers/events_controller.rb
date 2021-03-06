class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    respond_to do |format|
      format.html { 
        @events = Event.where(project_id: params[:project_id])
        @events = Event.all if current_user.admin?
      }
      format.js  {
        @events = Event.select { |e| current_user.account.projects.map(&:id) and [e.project_id] }
        @events = Event.all if current_user.admin?
        render json:  @events
      }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.starts_at = params[:date]
    @event.ends_at = params[:date]
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.account = current_user.account

    respond_to do |format|
      if @event.save
        format.html { redirect_to account_project_url(current_user.account, @event.project), notice: 'Event was successfully created.' }
        format.js { @project = @event.project }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to account_project_url(current_user.account, @event.project), notice: 'Event was successfully updated.' }
        format.js { @project = @event.project }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to account_project_url(current_user.account, @event.project) }
      format.js { @project = @event.project }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:project_id, :title, :description, :starts_at, :ends_at, :all_day)
    end
end
