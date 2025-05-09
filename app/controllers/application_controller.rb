class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :get_years_from_db

  private
    def get_years_from_db
      @years = Post.distinct.pluck(:year)
    end

end
