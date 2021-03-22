class SurveysController < ApplicationController

  # def create
  # @event = Event.find(params[:event_id])
  # @guest = Guest.find(params[:guest_id])
  # @survey = Survey.new(survey_params)
  # @surveys.guest.event = @survey
  #    if @survey.save!
  #   else
  #     render "events/show"
  #   end
  # end

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



