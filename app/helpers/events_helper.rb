module EventsHelper
  def normilize_event_date(start, ends, all_day)
    if start.utc == ends.utc or all_day
      "#{shortening_date start, all_day}"
    else
      "between #{shortening_date start, all_day} and #{shortening_date ends, all_day}"
    end
  end
  
  private
    
    def shortening_date(date, all_day)
      format = ""
      format += "%e"  unless date.strftime("%V%Y") == Date.today.strftime("%V%Y")
      format += " %A" unless date.strftime("%a %B") == Date.today.strftime("%a %B")
      format += " %B" unless date.strftime("%B") == Date.today.strftime("%B")
      format += " %Y" unless date.strftime("%Y") == Date.today.strftime("%Y")
      if all_day
        format += " all day"
      else
        format += " today at"  if date.strftime("%e %a %B %Y") == Date.today.strftime("%e %a %B %Y")
        format += " %k"
        unless date.strftime("%M").to_i == 0
          format += ":%M"
        else
          format += " hours"
        end
      end
      date.strftime(format)
    end
end
