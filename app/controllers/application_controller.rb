class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_years

  private
    def set_years
      @years = get_years_from_db
      @years << current_year if ! @years.include?(current_year)
      @years.sort!.reverse!
    end

    def get_years_from_db
      Post.distinct.pluck(:year)
    end

    def current_year
      date = Time.current.to_date
      if date.month >= 4
        date.year
      else
        date.year - 1
      end
    end
end
