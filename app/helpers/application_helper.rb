module ApplicationHelper
  def formatted_hour(date)
    date.strftime('%H:%M')
  end

  def formatted_date(date)
    date.strftime('%H:%M - %e %B')
  end
end
