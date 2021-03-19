class GuestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @guest = Guest.new
    @event = Event.find(params[:event_id])
    @guests = @event.guests
  end

  def create
    @event = Event.find(params[:event_id])
    @guest = Guest.new(guest_params)
    @guest.event = @event
    if @guest.save!
      redirect_to new_event_guest_path(@event), notice: "Guest is saved"
    else
      render :new
    end
  end

  def confirmation
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email, :event_id)
  end
end
