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
    if @event.save
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
      ["nut", @surveys.where(nut: true).count],
      ["peanut", @surveys.where(peanut: true).count],
      ["shellfish", @surveys.where(shellfish: true).count],
      ["egg", @surveys.where(egg: true).count],
      ["fish", @surveys.where(fish: true).count],
      ["soy", @surveys.where(soy: true).count],
      ["celery", @surveys.where(celery: true).count],
      ["sesame_seed", @surveys.where(sesame_seed: true).count],
      ["milk", @surveys.where(milk: true).count],
      ["sulphite", @surveys.where(sulphite: true).count],
      ["mustard", @surveys.where(mustard: true).count],
      ["gluten", @surveys.where(gluten: true).count],
      ["salt", @surveys.where(salt: true).count],
      ["nut", @surveys.where(nut: true).count],
      ["sugar", @surveys.where(sugar: true).count],
      ["hallal", @surveys.where(hallal: true).count],
      ["casher", @surveys.where(casher: true).count],
      ["vegan", @surveys.where(vegan: true).count],
      ["vegetarian", @surveys.where(vegetarian: true).count]
    ]
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "file_name",
                layout: 'pdf.html.erb'
                 # Excluding ".pdf" extension.
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :number_guest, :address, :user_id)
  end

  def event_params
    params.require(:event).permit(:title, :date, :number_guest, :address, :user_id)
  end
end
