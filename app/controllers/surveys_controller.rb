class SurveysController < ApplicationController

  def create
  @event = Event.find(params[:event_id])
  @guest = Guest.find(params[:guest_id])
  @survey = Survey.new(survey_params)
  @surveys.guest.event = @survey
     if @survey.save
    else
      render "events/show"
    end
  end

  def edit

    @event = Event.find(params[:event_id])
    @guest = Guest.find(params[:guest_id])
    @survey = Survey.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @survey = Survey.update(survey_params)
    redirect_to event_confirmation_path(@event)
  end
  def confirmation
  end



  private

  def survey_params
    params.require(:survey).permit(:nut, :peanut, :shellfish, :egg, :fish, :soy, :celery, :sesame_seed, :milk, :sulfite, :mustard, :gluten, :salt, :sugar, :hallal, :casher, :vegan, :vegetarian, :comment)
  end

end
