class EventsController < ApplicationController
  def index
    @events = Event.all.reverse
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
    if @event.save!
      redirect_to event_path(@event)
    else
      render "new"
    end
  end

  def preferences
    @event = Event.find(params[:event_id])
    @surveys = Survey.where(event_id: @event.id)
    #@data = @surveys.group(:nut)# :peanut, :shellfish, :egg, :fish, :soy, :celery, :sesame_seed, :milk, :sulphite, :mustard, :gluten, :salt, :sugar, :hallal, :casher, :vegan, :vegetarian).count
    @data = [
      ["nut", 32],
      ["egg", 52]

    ]

  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :number_guest, :address, :user_id)
    end
end
