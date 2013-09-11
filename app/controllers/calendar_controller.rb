class CalendarController < ApplicationController
  def index
    @events_url = account_events_url(current_user.account)
  end
end
