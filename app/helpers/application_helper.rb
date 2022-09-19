module ApplicationHelper
  def formatted_date(date)
    date.strftime('%H:%M')
  end
end
