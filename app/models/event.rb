class Event < ActiveRecord::Base
  belongs_to :project
  def as_json(options = {})
      {
        id: self.id,
        title: self.title,
        description: self.description || "",
        start: starts_at.rfc822,
        end: ends_at.rfc822,
        allDay: self.all_day,
        recurring: false,
        url: Rails.application.routes.url_helpers.event_path(id)
      }
    end
end
