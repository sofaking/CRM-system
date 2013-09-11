class CalendarController < ApplicationController
  def index
    @events_url = account_project_events_path(current_user.account, current_user.account.projects.last)
  end
end
