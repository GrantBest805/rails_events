class EventsController < ApplicationController
  def index
  	@user = User.find(current_user.id)
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update(event_params)
  		redirect_to "/events"
  	else
  		flash[:errors] = @event.errors.full_messages
  		redirect_to :back
  	end
  end

  def create 
  	@event = Event.new(event_params)
  	if @event.save
  		redirect_to :back
  	else
  		flash[:errors] = @event.errors.full_messages
  		redirect_to :back
  	end
  end
  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to :back
  end

  private
   def event_params
   	params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
   end
end
