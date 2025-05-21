module PostsHelper
  def current_year
    date = Time.current.to_date
    if date.month >= 4
      date.year
    else
      date.year - 1
    end
  end
end
