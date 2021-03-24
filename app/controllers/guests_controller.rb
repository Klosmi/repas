class GuestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @guest = Guest.all
  end

  def new
    @guest = Guest.new
    @event = Event.find(params[:event_id])

    if params[:query].present?
      sql_query = "first_name ILIKE :query OR email ILIKE :query OR last_name ILIKE :query"
      @guests = @event.guests.where(sql_query, query: "%#{params[:query]}%")
    else
     @guests = @event.guests

    end

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
    @event = @guest.event
    @guest.destroy
    redirect_to new_event_guest_path(@event)
  end

  def confirmation
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email)
  end
end
