class Event < ActiveRecord::Base
  belongs_to :account
  belongs_to :project
  
  def as_json(options = {})
    calendar_name = ' - ' + (self.project ? self.project.name : 'General')

    {
      id: self.id,
      title: self.title + calendar_name,
      description: self.description || "",
      start: starts_at.rfc822,
      end: ends_at.rfc822,
      allDay: self.all_day,
      recurring: false,
      url: Rails.application.routes.url_helpers.edit_account_event_path(self.account.id, id)
    }
  end
end
