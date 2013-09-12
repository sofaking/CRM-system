class CalendarController < ApplicationController
  def index
    @events_path = account_events_path(current_user.account)
  end
end
