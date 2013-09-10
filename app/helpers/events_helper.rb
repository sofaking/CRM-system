module EventsHelper
  def normilize_event_date(start, ends)
    if start.utc == ends.utc
      "#{shortening_date start}"
    else
      "between #{shortening_date start} and #{shortening_date ends}"
    end
  end
  
  private
    
    def shortening_date(date)
      format = ""
      format += "%e"  unless date.strftime("%e %a %B") == Date.today.strftime("%e %a %B")
      format += " %a" unless date.strftime("%a %B") == Date.today.strftime("%a %B")
      format += " %B" unless date.strftime("%B") == Date.today.strftime("%B")
      format += " %Y" unless date.strftime("%Y") == Date.today.strftime("%Y")
      format += " today at"  if date.strftime("%e %a %B %Y") == Date.today.strftime("%e %a %B %Y")
      format += " %k"
      unless date.strftime("%M").to_i == 0
        format += ":%M"
      else
        format += " hours"
      end
      date.strftime(format)
    end
end
