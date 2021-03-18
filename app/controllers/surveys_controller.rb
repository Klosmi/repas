class SurveysController < ApplicationController



def create
  @event = Event.find(params[:event_id])
  @survey = Survey.new(survey_params)
  @survey.event = @event
  if @survey.save
  else
    render "events/show"
  end
end


def edit
    @survey = Survey.find(params[:id])
end
def update
    @survey = Survey.update(survey_params)
    @guest = Guest.find(params[:guest_id])
    @survey.guest = @guest
    redirect_to survey_path(@survey)
end



#  private

#   def restaurant_params
#     params.require(:survey).permit(:nut, :peanut, :shellfish)
#   end
# end




