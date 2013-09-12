class Event < ActiveRecord::Base
  belongs_to :account
  belongs_to :project
  
  def as_json(options = {})
      {
        id: self.id,
        title: self.title + ' - ' + self.project.name,
        description: self.description || "",
        start: starts_at.rfc822,
        end: ends_at.rfc822,
        allDay: self.all_day,
        recurring: false,
        url: Rails.application.routes.url_helpers.account_event_path(self.project.account.id, id)
      }
    end
end
