class TeamsController < ApplicationController

  def index
    page_info = get_paging_order_info
    @search = Team.search(params[:q])
    @teams = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
  end

end