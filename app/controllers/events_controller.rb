class EventsController < ApiController
  expose :event

  def index
    @events = policy_scope(Event)
    render_resources @events
  end

  def create
    event.assign_attributes permitted_attributes(Event)
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
