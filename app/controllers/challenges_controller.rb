class ChallengesController < ApplicationController

  def index
    page_info = get_paging_order_info
    @search = Challenge.search(params[:q])
    @challenges = @search.result(:distinct => true).paginate(page: page_info[:page], per_page: page_info[:limit])
  end

end