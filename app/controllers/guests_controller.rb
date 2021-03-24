class GuestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @guest = Guest.all
  end

  def new
    @guest = Guest.new
    @event = Event.find(params[:event_id])
    @guests = @event.guests.order(created_at: :desc)
  end

  def create
    @event = Event.find(params[:event_id])
    @guest = Guest.new(guest_params)
    @guest.event = @event
    if @guest.save
      GuestMailer.with(guest:@guest).survey.deliver_now
      redirect_to new_event_guest_path(@event), notice: "Guest is saved"
    else
      render :index
    end
  end

  def edit
    @event = Event.find(params[:id])
    @guest = Guest.find(params[:guest_id])

    render 'events/show'
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guest_path(@guest.event)
  end

  def confirmation
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email)
  end
end
