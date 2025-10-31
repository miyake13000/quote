class PagesController < ApplicationController
  before_action :set_page, only: %i[ destroy ]

  # POST /posts
  def create
    @page = Page.new(page_params)
    @page.save
    respond_to do |format|
      format.turbo_stream
      format.html { render template: "post/index" }
    end
  end

  # DELETE /posts/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { render template: "post/index" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.expect(page: [ :name ])
    end
end
