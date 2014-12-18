class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
 

  respond_to :html


  def index
    if params[:search]
      @calendars = Calendar.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    else
      @calendars = Calendar.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    end
  end
 
 




  def show
    @calendar = Calendar.find(params[:id])
    # @tags = @calendar.events.uniq{|x| x.tag}
    @tags = @calendar.events.map{|t| t.tag}.uniq
 
  end

  def new
    @calendar = Calendar.new
    respond_with(@calendar)
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.save
    redirect_to root_path
  end

  def update
    @calendar.update(calendar_params)
    respond_with(@calendar)
  end

  def destroy
    @calendar.destroy
    respond_with(@calendar)
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end
    def authenticate_user
      redirect_to pages_home_path, notice: "You must be signed in to view that page" unless user_signed_in?
    end

    def calendar_params
      params.require(:calendar).permit(:zip, :year, :district, :event, :time1, :time2, :details)
    end
end
