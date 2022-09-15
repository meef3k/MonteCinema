module ApplicationHelper
  def formatted_date(date)
    date.strftime('%H:%M - %e %B')
  end
end
