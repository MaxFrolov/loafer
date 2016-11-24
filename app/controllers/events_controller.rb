class EventsController < ApiController
  expose :event

  def index
    @events = policy_scope(Event)
    render_resources @events.includes(:user)
  end

  def create
    event = current_user.events.build permitted_attributes(Event)
    authorize event
    event.save
    render_resource_or_errors event
  end

  def update
    event.update permitted_attributes(Event)
    render_resource_or_errors event
  end

  def destroy
    event.destroy
    render nothing: true
  end
end
