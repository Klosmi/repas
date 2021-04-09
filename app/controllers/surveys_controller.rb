class SurveysController < ApplicationController
  def edit
    @survey = Survey.find(params[:id])
    @event = @survey.event
    @guest = @survey.guest
  end

  def update
    @event = Event.find(params[:event_id])
    @survey = Survey.update(survey_params)
    redirect_to event_guest_confirmation_path(@event)
  end

  def confirmation
  end

  private

  def survey_params
    params.require(:survey).permit(:nut, :peanut, :shellfish, :egg, :fish, :soy, :celery, :sesame_seed, :milk, :sulphite, :mustard, :gluten, :salt, :sugar, :hallal, :casher, :vegan, :vegetarian, :comment)
  end
end
