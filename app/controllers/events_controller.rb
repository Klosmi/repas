class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render "new"
    end


  end
  def preferences
    @event = Event.find(params[:event_id])
    @surveys = Survey.where(event_id: @event.id)
  end

  #   def preferences
  #     @surveys = Survey.all
  #   end

    private

    def event_params
      params.require(:event).permit(:title, :date, :number_guest, :address, :user_id)
    end

  # end
  # class preferences < ApplicationController
  #   def
  #   end


  #   def new
  #     @result = Result.new
  #   end

  #   def create
  #     @result = Result.create(params[:result])

  #     if @result.save
  #       redirect_to @result
  #     else
  #       render action: :new
  #     end
  #   end

  #   def show
  #     @result = Result.find(params[:id])
  #   end
end
